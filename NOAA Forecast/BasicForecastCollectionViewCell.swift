//
//  TutorialCell.swift
//  RWDevCon
//
//  Created by Mic Pringle on 27/02/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
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
        imageView.image = nil
        
        
        dayOfTheWeek.text = weather.dayOfTheWeek[index]
        basicWeather.text = weather.weatherTitle[index]
        temperature.text = weather.temperatures[index]
        weatherDescription.text = weather.weatherDescriptions[index]
        
//        self.backgroundColor = UIColor(patternImage: UIImage(named: "Pattern")!)
        self.backgroundColor = UIColor(patternImage: UIImage(named: "WeatherPic-\(index + 1)")!)
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
    }
    
}
