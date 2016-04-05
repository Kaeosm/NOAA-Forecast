//
//  WeatherPics.swift
//  NOAA Forecast
//
//  Created by Kaelin Osmun on 3/29/16.
//  Copyright © 2016 Kaelin Osmun. All rights reserved.
//

import UIKit

class WeatherPics: WeatherBackgroundPics {
  
  class func allWeatherPics() -> [WeatherBackgroundPics] {
    var weatherPix = [WeatherBackgroundPics]()
    if let URL = NSBundle.mainBundle().URLForResource("WeatherPix", withExtension: "plist") {
      if let tutorialsFromPlist = NSArray(contentsOfURL: URL) {
        for dictionary in tutorialsFromPlist {
          let backgroundWeatherPix = WeatherPics(dictionary: dictionary as! NSDictionary)
          weatherPix.append(backgroundWeatherPix)
        }
      }
    }
    return weatherPix
  }
  
}
