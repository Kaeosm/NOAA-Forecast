//
//  Weather.swift
//  NOAA Forecast
//
//  Created by Kaelin Osmun on 3/23/16.
//  Copyright © 2016 Kaelin Osmun. All rights reserved.
//

import Foundation

class Weather {
    
    var temperatures: [String]
    var humidity: String
    var windSpeed: String
    var windChill: String
    var areaLocation: String
    var weatherTitle: [String]
    var weatherDescriptions: [String]
    var weatherIcons: [String]
    var dayOfTheWeek: [String]
    
    init?(json:[String:AnyObject]) {
        
        
        guard let data = json["data"] as? [String: AnyObject],
            temperatures = data["temperature"] as? [String],
            weatherTitle = data["weather"] as? [String],
            weatherDescriptions = data["text"] as? [String],
            weatherIcons = data["iconLink"] as? [String] else {
        
                return nil
        }
        //Basic Weather Title
        self.weatherTitle = weatherTitle
        //Temperatures
        self.temperatures = temperatures
        //Weather Description
        self.weatherDescriptions = weatherDescriptions
        //Weather Images for Icon
        self.weatherIcons = weatherIcons
        
        // Day of The Week
        guard let time = json["time"] as? [String: AnyObject],
            dayOfTheWeek = time["startPeriodName"] as? [String] else {
                return nil
        }
        //Day of the Week
        self.dayOfTheWeek = dayOfTheWeek
        
        //CurrentObservation
        
        guard let currentObservation = json["currentobservation"] as? [String: AnyObject],
            humidity = currentObservation["Relh"] as? String,
            windSpeed = currentObservation["Winds"] as? String,
            windChill = currentObservation["WindChill"] as? String else {
                
                return nil
        }
        self.windSpeed = windSpeed
        self.humidity = humidity
        self.windChill = windChill
        
        //Area Description
        guard let location = json["location"] as? [String: AnyObject],
            areaLocation = location["areaDescription"] as? String else {
                return nil
        }
        self.areaLocation = areaLocation
    }
    
}




