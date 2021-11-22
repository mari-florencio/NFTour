//
//  AR.swift
//  NFTour
//
//  Created by Alessandra Fernandes Lacerda on 18/11/21.
//

import UIKit
import ARKit
import CoreLocation

class ARViewController: UIViewController, CLLocationManagerDelegate {
    
    private var arView = ARView()
    let locationManager = CLLocationManager()
    let arServices = ARServices()
    
    override func loadView() {
        view = arView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.headingFilter = 1
        locationManager.startUpdatingHeading()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapView(_:)))
        view.addGestureRecognizer(tap)

    }
    
    @objc func didTapView(_ sender: UITapGestureRecognizer) {
        arServices.placeAsset(arView: arView.arSceneView, asset: UIImage(named: "nft1")!)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        print(newHeading.trueHeading)
    }
}
