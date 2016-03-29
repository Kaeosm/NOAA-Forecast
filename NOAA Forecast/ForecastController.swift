//
//  ForecastController.swift
//  NOAA Forecast
//
//  Created by Kaelin Osmun on 3/29/16.
//  Copyright © 2016 Kaelin Osmun. All rights reserved.
//

import Foundation

class ForecastController {

    // Method that takes in (lat,long) and returns forecast Weather Object
    // Json Serialization -> == Weather Object
    
    static let SharedInstance = ForecastController()
    
    var locationCoordinates: String? = nil {
        didSet{
            print("The Coordinates are \(locationCoordinates)")
        }
    }
    
    var weather: [Weather] = [] {
        didSet{
            print("The weather data is \(weather)")
        }
    }
    
    static func fetchCoordinates(completion: (locationCoordinates: String?) -> Void) {
        let urlString = "http://forecast.weather.gov/MapClick.php?"
        NetworkController.dataAtURL(urlString) { (data) in
            guard let data = data,
                json = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) else {
                    print("JSON could not be serialized from data")
                    completion(locationCoordinates: nil)
                    return
            }
            if let responseDictionary = json as? [String: AnyObject] {
                if let locationCoordinates = responseDictionary["location_coordinates"] as? String {
                    SharedInstance.locationCoordinates = locationCoordinates
                    completion(locationCoordinates: locationCoordinates)
                } else {
                    completion(locationCoordinates: nil)
                    print("Latitude and Longitude do not exist in the network call's response")
                    
                }
            } else {
                completion(locationCoordinates: nil)
                print("jsonObject wasn't of type [String: AnyObject]")
            }
        }
    }

    static func fetchWeather(completion: (weather: [Weather]) -> Void) {
        guard let locationCoordinates = SharedInstance.locationCoordinates else {print("No Weather"); completion(weather: []); return}
        let urlString = "http://forecast.weather.gov/MapClick.php?\(locationCoordinates)?count=10"
        NetworkController.dataAtURL(urlString) { (data) in
            guard let data = data,
                json = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) else {
                    print("JSON could not be serialized from data")
                    completion(weather: [])
                    return
            }
            if let responseDictioanry = json as? [String: AnyObject] {
                if let weatherArray = responseDictioanry["weather"] as? [[String: AnyObject]] {
                    var weather: [Weather] = []
                    for weatherDictionary in weatherArray {
                        if let newWeather = Weather(json: weatherDictionary) {
                            weather.append(newWeather)
                        }
                    }
                    //let weather = weatherArray.flatMap({Weather(weatherDictionary: $0)})
                    SharedInstance.weather = weather
                    completion(weather: weather)
                } else {
                    print("weatherArray wasn't of type [[String:AnyObject]]")
                    completion(weather: [])
                }
                } else {
                    completion(weather: [])
                    print("the response wasn't of type [String: AnyObject]")
                }
            }
        }
    }

    
    
