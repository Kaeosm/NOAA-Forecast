//
//  Weather.swift
//  NOAA Forecast
//
//  Created by Kaelin Osmun on 3/23/16.
//  Copyright © 2016 Kaelin Osmun. All rights reserved.
//

import Foundation

class Weather {
    
    var temperatures: [Int]
    var humidity: String
    var windSpeed: String
    var windChill: String
    var areaLocation: String
    var weatherDescriptions: [String: AnyObject]
    var weatherIcons: [String: AnyObject]
    
    init?(json:[String:AnyObject]) {
    
        if let data = json["data"] as? [String: AnyObject] {
            //Temperatures
            if let temperatures = data["temperature"] as? [Int] {
                self.temperatures = temperatures
             
            }
            //Weather Description
            if let weatherDescriptions = data["text"] as? [String: AnyObject] {
                self.weatherDescriptions = weatherDescriptions
            }
            
            //Weather Images for Icon
            if let weatherIcons = data["iconLink"] as? [String: AnyObject] {
                self.weatherIcons = weatherIcons
                
            }
            
        }
        //CurrentObservation
        if let currentObservation = json["currentobservation"] as? [String: AnyObject] {
            if let humidity = currentObservation["Relh"] as? String {
                self.humidity = humidity
            }
            if let windSpeed = currentObservation["Winds"] as? String {
                self.windSpeed = windSpeed
            }
            if let windChill = currentObservation["WindChill"] as? String {
                self.windChill = windChill
            }
        }
        //Area Description
        if let location = json["location"] as? [String: AnyObject] {
            if let areaLocation = location["areaDescription"] as? String {
                self.areaLocation = areaLocation
            }
            
            }
        }
    
    }


