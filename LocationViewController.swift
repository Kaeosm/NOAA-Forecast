//
//  LocationController.swift
//  NOAA Forecast
//
//  Created by Kaelin Osmun on 3/22/16.
//  Copyright © 2016 Kaelin Osmun. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import AddressBook


class LocationViewController: UIViewController, UITextFieldDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var cityTextField: UITextField!
    var latitude: Double?
    var longitude: Double?
    
    @IBAction func appInfoButtonTapped(sender: AnyObject) {
        let alertController = UIAlertController(title: "Pinpoint Weather", message: "This app will allow you to specify A custom location, which will return weather for that exact latitude and longitude within a square mile radius. It's perfect for outdoor activites. The developer's favorite use is Ski Touring - which can tell you how many inches of Snow one ridge will receive compared to another half a mile away.", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
   
    
    @IBAction func setLocationWithCityButton(sender: AnyObject) {
      
        if let city = cityTextField.text {
            LocationController.getCoordinatesFromCity(city, completion: { (longitude, latitude) in
                dispatch_async(dispatch_get_main_queue(), {
                    self.latitude = latitude
                    self.longitude = longitude
                    self.performSegueWithIdentifier("segueToMapFromCity", sender: self)
                })
            })
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cityTextField.delegate = self;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueToMapFromCity" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let mapVC = navigationController.viewControllers[0] as! MapViewController
            mapVC.longitude = longitude
            mapVC.latitude = latitude
            mapVC.useCurrentLocation = false
        
        } else {
            
            let navigationController = segue.destinationViewController as! UINavigationController
            let mapVC = navigationController.viewControllers[0] as! MapViewController
            mapVC.useCurrentLocation = true
        }
    }
}

