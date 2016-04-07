//
//  LocationController.swift
//  NOAA Forecast
//
//  Created by Kaelin Osmun on 4/4/16.
//  Copyright © 2016 Kaelin Osmun. All rights reserved.
//

import Foundation
import MapKit

class LocationController: NSObject, MKMapViewDelegate {
    
    static var annotation = MKPointAnnotation()
    static let locationManager = CLLocationManager()
    
    static func fetchLocation() {
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    static func setAnnotationCoordinates() {
        if let location = locationManager.location {
            annotation.coordinate = CLLocationCoordinate2D(latitude: (location.coordinate.latitude), longitude: location.coordinate.longitude)
        }
    }
    
    // Get City Name from Location Coordinates
    
    static func getCityName(location: CLLocation, completion: (city: String) -> Void ) {
        
        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
            if error != nil {
                print("Could not find City")
                completion(city: "")
            } else {
                if let unwrappedPlacemarks = placemarks {
                    if unwrappedPlacemarks.count > 0 {
                        let pm = unwrappedPlacemarks[0]
                        if let cityName = pm.locality {
                            completion(city: cityName)
                        } else {
                            completion(city: "")
                        }
                    } else {
                        completion(city: "")
                    }
                } else {
                    completion(city: "")
                }
            }
            
        }
        
    }
    
    static func getCoordinatesFromCity(cityName: String, completion: (longitude: CLLocationDegrees?, latitude: CLLocationDegrees?) -> Void ) {
        CLGeocoder().geocodeAddressString(cityName) { (placemarks, error) in
            if error != nil {
                print(error?.localizedDescription)
                completion(longitude: nil, latitude: nil)
            } else {
                if let placemarks = placemarks, firstPlacemark = placemarks.first, location = firstPlacemark.location {
                    completion(longitude: location.coordinate.longitude, latitude: location.coordinate.latitude)
                } else {
                    completion(longitude: nil, latitude: nil)
                }
            }
        }
    }
}