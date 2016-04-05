//
//  ForecastController.swift
//  NOAA Forecast
//
//  Created by Kaelin Osmun on 3/29/16.
//  Copyright © 2016 Kaelin Osmun. All rights reserved.
//

import Foundation

class ForecastController {
    
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
    
    static func fetchWeatherWithCoordinates(long: String, lat: String, completion: (weather: Weather?) -> Void) {
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
                print("jsonObject wasn't of type [String: AnyObject]")
                completion(weather: nil)
            }
        }
    }
}




