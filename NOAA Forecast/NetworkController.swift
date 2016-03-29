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



