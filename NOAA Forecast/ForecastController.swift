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
    
    static func fetchCoordinates(lat: String, long: String, completion: (weather: Weather?) -> Void) {
        let urlString = NetworkController.baseURLCoordinates(lat, longitude: long)
        NetworkController.dataAtURL(urlString) { (data) in
            guard let data = data,
                json = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) else {
                    print("JSON could not be serialized from data")
                    completion(weather: nil)
                    return
            }
            if let responseDictionary = json as? [String: AnyObject] {
                if let weather = Weather(json: responseDictionary) {
                    completion(weather: weather)
                }
            } else {
                completion(weather: nil)
                print("jsonObject wasn't of type [String: AnyObject]")
            }
        }
    }
}

//    static func fetchWeather(completion: (weather: [Weather]) -> Void) {
//        guard let locationCoordinates = SharedInstance.locationCoordinates else {print("No Weather"); completion(weather: []); return}
//        let urlString = "http://forecast.weather.gov/MapClick.php?\(locationCoordinates)?count=10"
//        NetworkController.dataAtURL(urlString) { (data) in
//            guard let data = data,
//                json = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) else {
//                    print("JSON could not be serialized from data")
//                    completion(weather: [])
//                    return
//            }
//            if let responseDictioanry = json as? [String: AnyObject] {
//                if let weatherArray = responseDictioanry["weather"] as? [[String: AnyObject]] {
//                    var weather: [Weather] = []
//                    for weatherDictionary in weatherArray {
//                        if let newWeather = Weather(json: weatherDictionary) {
//                            weather.append(newWeather)
//                        }
//                    }
//                    //let weather = weatherArray.flatMap({Weather(weatherDictionary: $0)})
//                    SharedInstance.weather = weather
//                    completion(weather: weather)
//                } else {
//                    print("weatherArray wasn't of type [[String:AnyObject]]")
//                    completion(weather: [])
//                }
//            } else {
//                completion(weather: [])
//                print("the response wasn't of type [String: AnyObject]")
//            }
//        }
//    }



