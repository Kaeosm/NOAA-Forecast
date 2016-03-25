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

class MapController: UIViewController, MKMapViewDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!

    var annotation = MKPointAnnotation()
    var userCoordinates = ""
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //Initialize location manager
//        locationManager.delegate = self;
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.requestAlwaysAuthorization()
//        locationManager.startUpdatingLocation()
        
        self.mapView.delegate = self
        self.mapView.showsUserLocation = true
        self.mapView.setUserTrackingMode(MKUserTrackingMode.Follow, animated: true)
        
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = CLLocationCoordinate2D(latitude: self.mapView.userLocation.coordinate.latitude, longitude: self.mapView.userLocation.coordinate.longitude)
        self.mapView.addAnnotation(dropPin)
        
        let createPin = UITapGestureRecognizer(target: self, action: ("tapGestureRecognizer:"))
        self.view.addGestureRecognizer(createPin)
        
    }
    
//    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
//        let userLocation:CLLocation = locations[0] as! CLLocation
//        let long = userLocation.coordinate.longitude;
//        let lat = userLocation.coordinate.latitude;
//        
//    }
    
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
            // Callout Annotation
            annotation.coordinate = newCoordinate
            annotation.title = "(\(latitude),\(longitude)"
            mapView.addAnnotation(annotation)
            
            // Creates the span and animated zoomed into an area
            let span = MKCoordinateSpanMake(0.5, 0.5)
            let region = MKCoordinateRegion(center: newCoordinate, span: span)
            mapView.setRegion(region, animated: true)
            
            // Zoom into new pin without a region
            //self.mapView.showAnnotations(self.mapView.annotations, animated: true)
            
//             Automatically show annotation callout
            let yourAnnotationAtIndex = 0
            mapView.selectAnnotation(mapView.annotations[yourAnnotationAtIndex], animated: false)
            
    }

        
        
    }
        

