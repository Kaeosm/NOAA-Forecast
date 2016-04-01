//
//  MapController.swift
//  NOAA Forecast
//
//  Created by Kaelin Osmun on 3/21/16.
//  Copyright © 2016 Kaelin Osmun. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBAction func dismissMapViewTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var mapView: MKMapView!
    
    var annotation = MKPointAnnotation()
    let locationManager = CLLocationManager()
    
    // TODO: - Seperate code for MapKit and Core Location into new classes
    // TODO: - Create WeatherController that serializes the data we get from our url in NetworkController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        self.mapView.delegate = self
        self.mapView.showsUserLocation = true
        self.mapView.setUserTrackingMode(MKUserTrackingMode.Follow, animated: true)

        if let location = locationManager.location {
            annotation.coordinate = CLLocationCoordinate2D(latitude: (location.coordinate.latitude), longitude: location.coordinate.longitude)
            
        }
        
        self.mapView.addAnnotation(annotation)
        
        let createPin = UITapGestureRecognizer(target: self, action: #selector(tapGestureRecognizer))
        self.view.addGestureRecognizer(createPin)
        
        
    }
    
    @IBAction func useLocationButtonTapped(sender: AnyObject) {
        
    }
    
    @IBAction func homeButtonTapped(sender: AnyObject) {
        
    }
    
    
    
    // Drop a NEW PIN
    func tapGestureRecognizer(tapGestureRecognizer: UITapGestureRecognizer) {
        print(locationManager)
        
        // Delete previous annotations so only one pin exists on the map at one time
        mapView.removeAnnotations(mapView.annotations)
        mapView.removeOverlays(mapView.overlays)
        
        let touchPoint = tapGestureRecognizer.locationInView(self.mapView)
        let newCoordinate: CLLocationCoordinate2D = mapView.convertPoint(touchPoint, toCoordinateFromView: mapView)
        let latitude = newCoordinate.latitude
        let longitude = newCoordinate.longitude
        
        let url = NetworkController.baseURLCoordinates("\(latitude)", longitude: "\(longitude)")
        print(url)
        
        // Callout Annotation
        annotation.coordinate = newCoordinate
        annotation.title = "Custom Location"
        mapView.addAnnotation(annotation)
        
        // Creates the span and animated zoomed into an area
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegion(center: newCoordinate, span: span)
        mapView.setRegion(region, animated: true)
        
        // Zoom into new pin without a region
        //self.mapView.showAnnotations(self.mapView.annotations, animated: true)
        
        //             Automatically show annotation callout
        let yourAnnotationAtIndex = 0
        mapView.selectAnnotation(mapView.annotations[yourAnnotationAtIndex], animated: false)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toForecastVC" {
            let customForecastVC = segue.destinationViewController as! ForecastTableViewController
            customForecastVC.latitude = "\(annotation.coordinate.latitude)"
            customForecastVC.longitude = "\(annotation.coordinate.longitude)"
            
        }
    }
}


