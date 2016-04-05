//
//  ForecastCollectionViewController.swift
//  NOAA Forecast
//
//  Created by Kaelin Osmun on 4/4/16.
//  Copyright © 2016 Kaelin Osmun. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ForecastCollectionViewController: UICollectionViewController {
    
    
    var currentRow = -1
    var latitude: String?
    var longitude: String?
    var weather: Weather?
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let latitude = latitude, longitude = longitude {
            ForecastController.fetchWeatherWithCoordinates(longitude, lat: latitude, completion: { (weather) in
                self.weather = weather
                dispatch_async(dispatch_get_main_queue(), {
                    self.collectionView!.reloadData()
                })
            })
        }
        
        if let patternImage = UIImage(named: "Pattern") {
            view.backgroundColor = UIColor(patternImage: patternImage)
        }
        collectionView!.backgroundColor = UIColor.clearColor()
        collectionView!.decelerationRate = UIScrollViewDecelerationRateFast
    }
    
}

extension ForecastCollectionViewController {
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! BasicForecastCollectionViewCell
        if let weather = weather {
            cell.configureCellWithWeather(weather, index: indexPath.row)
        }
        return cell
    }
    
}