//
//  NetworkController.swift
//  NOAA Forecast
//
//  Created by Kaelin Osmun on 3/23/16.
//  Copyright © 2016 Kaelin Osmun. All rights reserved.
//

import Foundation

class NetworkController {

    static func baseURLCoordinates(latitude: String, longitude: String) -> NSURL {
        let modifiedSearchLocation = "lat=\(latitude)&lon=\(longitude)"
        return NSURL(string: "http://forecast.weather.gov/MapClick.php?\(modifiedSearchLocation)&FcstType=json")!
 
        
        // TODO: - Data at url method
}
}