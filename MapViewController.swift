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
    
    var useCityLocation: Bool?
    var useCurrentLocation: Bool?
    var latitude: Double?
    var longitude: Double?
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.delegate = self
        self.mapView.showsUserLocation = true
        self.mapView.setUserTrackingMode(MKUserTrackingMode.Follow, animated: true)
        
        LocationController.fetchLocation()
        
        LocationController.setAnnotationCoordinates()
        if useCurrentLocation == true {
            self.mapView.addAnnotation(LocationController.annotation)
        } else {
            let annotation = MKPointAnnotation()
            if let unwrappedLatitude = latitude, unwrappedLongitude = longitude {
                annotation.coordinate = CLLocationCoordinate2D(latitude: unwrappedLatitude, longitude: unwrappedLongitude)
                self.mapView.addAnnotation(annotation)
                let span = MKCoordinateSpanMake(0.03, 0.03)
                let region = MKCoordinateRegion(center: annotation.coordinate, span: span)
                mapView.setRegion(region, animated: true)
        }
        
        let createPin = UITapGestureRecognizer(target: self, action: #selector(tapGestureRecognizer))
        self.view.addGestureRecognizer(createPin)
        
        }
    }
    
    @IBAction func useLocationButtonTapped(sender: AnyObject) {
        
    }
    
    @IBAction func homeButtonTapped(sender: AnyObject) {
        
    }

    // Drop a NEW PIN
    func tapGestureRecognizer(tapGestureRecognizer: UITapGestureRecognizer) {
        
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
        LocationController.annotation.coordinate = newCoordinate
        let location = CLLocation(latitude: LocationController.annotation.coordinate.latitude, longitude: LocationController.annotation.coordinate.longitude)
        LocationController.getCityName(location) { (city) in
            LocationController.annotation.title = city
        }
        mapView.addAnnotation(LocationController.annotation)
        
        // Creates the span and animated zoomed into an area
        let span = MKCoordinateSpanMake(0.03, 0.03)
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
            let customForecastVC = segue.destinationViewController as! ForecastCollectionViewController
            customForecastVC.latitude = "\(LocationController.annotation.coordinate.latitude)"
            customForecastVC.longitude = "\(LocationController.annotation.coordinate.longitude)"
            
        }
    }
}


