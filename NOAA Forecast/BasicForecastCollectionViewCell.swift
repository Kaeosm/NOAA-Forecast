//
//  ForecastController.swift
//  NOAA Forecast
//
//  Created by Kaelin Osmun on 3/29/16.
//  Copyright © 2016 Kaelin Osmun. All rights reserved.
//

import UIKit

class BasicForecastCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var imageView: UIImageView!
    
    @IBOutlet private weak var imageCoverView: UIView!
    
    //    @IBOutlet weak var weatherIcon: UIImageView!
    
    @IBOutlet weak var dayOfTheWeek: UILabel!
    
    @IBOutlet weak var basicWeather: UILabel!
    
    @IBOutlet weak var temperature: UILabel!
    
    @IBOutlet weak var weatherDescription: UILabel!
    
    
    //    @IBOutlet weak var windChill: UILabel!
    
    func configureCellWithWeather(weather: Weather, index: Int) {
        
        dayOfTheWeek.text = ""
        basicWeather.text = ""
        temperature.text = ""
        imageView.image = UIImage(named: "WeatherPic-\(index + 1)")
        imageView.contentMode = .ScaleAspectFill
        
        dayOfTheWeek.text = weather.dayOfTheWeek[index]
        basicWeather.text = weather.weatherTitle[index]
        temperature.text = weather.temperatures[index]
        weatherDescription.text = weather.weatherDescriptions[index]
        
    }
    
    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
        super.applyLayoutAttributes(layoutAttributes)
        
        let featuredHeight = UltravisualLayoutConstants.Cell.featuredHeight
        let standardHeight = UltravisualLayoutConstants.Cell.standardHeight
        
        let delta = 1 - ((featuredHeight - CGRectGetHeight(frame)) / (featuredHeight - standardHeight))
        
        let minAlpha: CGFloat = 0.3
        let maxAlpha: CGFloat = 0.75
        
        imageCoverView.alpha = maxAlpha - (delta * (maxAlpha - minAlpha))
        
        let scale = max(delta, 0.5)
        dayOfTheWeek.transform = CGAffineTransformMakeScale(scale, scale)
        
        temperature.alpha = delta
        basicWeather.alpha = delta
        weatherDescription.alpha = delta
        
    }
    
}
