//
//  LocalizationServices.swift
//  NFTour
//
//  Created by Guilerme Barciki on 18/11/21.
//

import Foundation
import CoreLocation
import MapKit

class LocalizationServices: NSObject,  CLLocationManagerDelegate {
    
    var locationManager : CLLocationManager = {
        let locationManager = CLLocationManager()
        if (CLLocationManager.headingAvailable()) {
            locationManager.headingFilter = 1
            
            
            locationManager.startUpdatingHeading()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            
            locationManager.startUpdatingLocation()
        }
        return locationManager
    }()
    
   
    override init () {
        super.init()
        locationManager.delegate = self
    }
   
    
    func getUserLocation() -> CLLocation {
        
        return locationManager.location ?? CLLocation(latitude: 0.0, longitude: 0.0)
        
    }
    
    func getCompassHeading() -> Double {
        
        return locationManager.heading?.trueHeading ?? 1.0
    
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations.first
        locations.last
    }
    
    func isNFTnear(nftCoordinate: CLLocation) -> Bool {
        
        let userLocation = getUserLocation()
        if userLocation.distance(from: nftCoordinate) > 20 {
            return false
        } else {
            return true
        }
        
    }
    
    
    
}

