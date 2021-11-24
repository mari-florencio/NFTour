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
    
    lazy var locationManager : CLLocationManager = {
        let locationManager = CLLocationManager()
        if (CLLocationManager.headingAvailable()) {
            locationManager.headingFilter = 1
            locationManager.startUpdatingHeading()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            
            locationManager.startUpdatingLocation()
        }
        return locationManager
    }()
    
//    let locationManager = CLLocationManager()
   private var compassHeading: Double =  0.0
    
   
    
    func getUserLocation() -> CLLocation {
        
        return locationManager.location ?? CLLocation(latitude: 0.0, longitude: 0.0)
        
    }
    
    func getCompassHeading() -> Double {
        
        return compassHeading
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        
        compassHeading = newHeading.trueHeading
        
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

