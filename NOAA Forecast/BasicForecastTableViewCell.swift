//
//  BasicForecastTableViewCell.swift
//  NOAA Forecast
//
//  Created by Kaelin Osmun on 3/29/16.
//  Copyright © 2016 Kaelin Osmun. All rights reserved.
//

import UIKit

class BasicForecastTableViewCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    
    @IBOutlet weak var dayOfTheWeek: UILabel!
    
    @IBOutlet weak var basicWeather: UILabel!
    
    @IBOutlet weak var temperature: UILabel!
    
    @IBOutlet weak var windChill: UILabel!
    
    func configureCellWithWeather(weather: Weather, index: Int) {
        dayOfTheWeek.text = weather.dayOfTheWeek[index]
        basicWeather.text = weather.weatherTitle[index]
        temperature.text = weather.temperatures[index]
        windChill.text = weather.windChill
        
        
    }
}
