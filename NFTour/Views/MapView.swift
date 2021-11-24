//
//  MapView.swift
//  NFTour
//
//  Created by Guilerme Barciki on 17/11/21.
//

import Foundation
import MapKit
import CoreLocation
import SwiftUI

class MapView: UIView, CLLocationManagerDelegate, MKMapViewDelegate {
    var userCoordinate = CLLocation()
    var locationManager = CLLocationManager()
    let profile = Model().profile
    
    
    
    lazy var mapView: MKMapView = {
        let view = MKMapView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    init() {
        super.init(frame: .zero)
        localizationManagerSetup()
        mapSetup()
        //mapView.setUserTrackingMode(.followWithHeading, animated: true)
        setupView()
        loadNftsPins()
        
        
        let region = MKCoordinateRegion(center: userCoordinate.coordinate, latitudinalMeters: 20000, longitudinalMeters: 20000)
        mapView.region = region
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func mapSetup() {
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.setUserTrackingMode(.followWithHeading, animated: true)
    }

    func localizationManagerSetup() {
        locationManager.requestWhenInUseAuthorization()
        userCoordinate = locationManager.location ?? CLLocation.init(latitude: 0, longitude: 0)
        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
    }
    
   func setupView() {
        addSubview(mapView)
        mapConstraints()
    }
    
    func mapConstraints() {
        NSLayoutConstraint.activate([
        mapView.heightAnchor.constraint(equalTo: heightAnchor),
        mapView.widthAnchor.constraint(equalTo: widthAnchor),
        mapView.centerXAnchor.constraint(equalTo: centerXAnchor),
        mapView.centerYAnchor.constraint(equalTo: centerYAnchor)])
    }
    private func loadNftsPins() {
        let nftsList = profile.nfts
        for nft in nftsList {
            let annotation = MKPointAnnotation()
            annotation.coordinate = nft.coordinates.coordinate
            
            print("testando coordenadas \(annotation.coordinate)")
            mapView.addAnnotation(annotation)
        }
    }
}

