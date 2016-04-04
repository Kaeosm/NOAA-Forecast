//
//  LocationController.swift
//  NOAA Forecast
//
//  Created by Kaelin Osmun on 3/22/16.
//  Copyright © 2016 Kaelin Osmun. All rights reserved.
//

import UIKit
import MapKit


class LocationViewController: UIViewController {
    
    @IBAction func appInfoButtonTapped(sender: AnyObject) {
        let alertController = UIAlertController(title: "Pinpoint Weather", message: "This app will allow you to specify A custom location, which will return weather for that exact latitude and longitude within a small area. It's perfect for outdoor activites. The developer's favorite use is Ski Touring - which can tell you how many inches of Snow one ridge got compared to another half a mile away.", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
    self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        
    }
}
