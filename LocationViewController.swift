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
        let alertController = UIAlertController(title: "Pinpoint Weather", message: "Thanks for downloading Pinpoint Weather! This app will allow you to specify A custom location, which will return data for that exact latitude and longitude."
        
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
