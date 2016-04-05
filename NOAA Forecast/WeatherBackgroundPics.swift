//
//  WeatherBackgroundPics.swift
//  NOAA Forecast
//
//  Created by Kaelin Osmun on 4/5/16.
//  Copyright © 2016 Kaelin Osmun. All rights reserved.
//

import Foundation
import UIKit

class WeatherBackgroundPics {
    
    var backgroundImage: UIImage


init(backgroundImage: UIImage) {
    self.backgroundImage = backgroundImage
}

convenience init(dictionary: NSDictionary) {
    let backgroundName = dictionary["Background"] as? String
    let backgroundImage = UIImage(named: backgroundName!)
    self.init(backgroundImage: backgroundImage!.decompressedImage)
}
}
