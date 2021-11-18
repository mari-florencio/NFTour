//
//  MapViewController.swift
//  NFTour
//
//  Created by Guilerme Barciki on 17/11/21.
//

import Foundation
import UIKit

class MapViewController: UIViewController {
    
    let mapView : MapView = {
        let view = MapView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        setupMapView()
    }
    
    func setupMapView() {
        view.addSubview(mapView)
        setupMapViewConstraints()
    }
    
    func setupMapViewConstraints() {
        NSLayoutConstraint.activate([
            mapView.heightAnchor.constraint(equalTo: self.view.heightAnchor),
            mapView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            mapView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            mapView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)])
    }
}
