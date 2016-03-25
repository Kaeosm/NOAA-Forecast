//
//  Weather.swift
//  NOAA Forecast
//
//  Created by Kaelin Osmun on 3/23/16.
//  Copyright © 2016 Kaelin Osmun. All rights reserved.
//

//import Foundation
//
//class Weather {
//    
//    var temperatures: [String]
//    var humidity: String
//    var windSpeed: String
//    var windChill: String
//    var areaLocation: String
//    var weatherDescriptions: [String]
//    var weatherImages: [String]
//    
//    init?(json:[String:AnyObject]) {
//    
//        if let data = json["data"] as? [String: AnyObject] {
//            //Temperatures
//            if let temperatures = data["temperature"] as? [[String: AnyObject]] {
//                var tempArray  = [String]()
//                var i = 0
//                repeat {
//                    if let value = temperatures[i]["\(i)"] as? String {
//                        tempArray.append(value)
//                    }
//                    i += 1
//                } while i <= temperatures.count
//                self.temperatures = tempArray
//             
//            }
//            //Weather Description
//            if let weatherDescriptions = data["text"] as? [[String: AnyObject]] {
//                var tempArray = [String]()
//                var i = 0
//                repeat {
//                    if let value = weatherDescriptions[i]["text"] as? String {
//                        tempArray.append(value)
//                    }
//                    i += 1
//                } while i <= weatherDescriptions.count
//                self.weatherDescriptions = tempArray
//            }
//            
//            //Weather Images for Icon
//            if let iconLinks = data["iconLink"] as? [[String: AnyObject]] {
//                var tempArray = [String]()
//                var i = 0
//                repeat {
//                    if let value = iconLinks[i]["\(i)"] as? String {
//                        tempArray.append(value)
//                    }
//                    i += 1
//                } while i <= iconLinks.count
//                self.weatherImages = tempArray
//                
//            }
//            
//        }
//        //CurrentObservation
//        if let currentObservation = json["currentobservation"] as? [String: AnyObject] {
//            if let humidity = currentObservation["Relh"] as? String {
//                self.humidity = humidity
//            }
//            if let windSpeed = currentObservation["Winds"] as? String {
//                self.windSpeed = windSpeed
//            }
//            if let windChill = currentObservation["WindChill"] as? String {
//                self.windChill = windChill
//            }
//        }
//        //Area Description
//        if let location = json["location"] as? [String: AnyObject] {
//            if let areaLocation = location["areaDescription"] as? String {
//                self.areaLocation = areaLocation
//            }
//            
//            }
//        }
//    
//    }
//
//
