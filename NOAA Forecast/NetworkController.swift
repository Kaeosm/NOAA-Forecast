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
        let modifiedSearchLocation = "lon=\(longitude)&lat=\(latitude)"
        return NSURL(string: "http://forecast.weather.gov/MapClick.php?\(modifiedSearchLocation)&FcstType=json")!
        
    }
    static func dataAtURL(url: NSURL, completion: (data: NSData?) -> Void) {
        let dataTask = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, _, error) in
            if let error = error {
                print("Error fetching data at \(url). \(error.localizedDescription)")
                completion(data: nil)
            } else if let data = data {
                completion(data: data)
            } else {
                completion(data: nil)
                print("No data")
            }
        })
        dataTask.resume()
    }
}

// http://forecast.weather.gov/MapClick.php?lon=-111.56813428659063&lat=40.60066141047355&FcstType=json
// http://forecast.weather.gov/MapClick.php?lat=-111.56813428659063&lon=40.60066141047355&FcstType=json

