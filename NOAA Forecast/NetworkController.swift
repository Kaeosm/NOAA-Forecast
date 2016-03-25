//
//  NetworkController.swift
//  NOAA Forecast
//
//  Created by Kaelin Osmun on 3/23/16.
//  Copyright © 2016 Kaelin Osmun. All rights reserved.
//

import Foundation

class NetworkController {

    static func baseURL(searchLocation:String) -> NSURL {
        let modifiedSearchLocation = searchLocation.stringByReplacingOccurrencesOfString(" ", withString: "+")
        return NSURL(string: "http://forecast.weather.gov/MapClick.php\(modifiedSearchLocation)toBeDeterminted")!
        
}
}