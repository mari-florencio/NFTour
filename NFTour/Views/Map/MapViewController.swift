//
//  MapViewController.swift
//  NFTour
//
//  Created by Guilerme Barciki on 17/11/21.
//

import Foundation
import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    let mapView : MapView = {
        let view = MapView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let secondView : MapScreenCollectionView = {
        let view = MapScreenCollectionView(profile: Model().profile)
        view.view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var profile: ProfileUser = Model().profile
    private var collectionData = [HomeCollection.CollectionData]()
    private lazy var backButton: BackButton = .init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tabBarController?.tabBar.isHidden = true
        for nft in profile.nfts {
            collectionData.append(.init(nft: nft))
        }
        setupMapView()
//        secondView.configureView(with: collectionData)
//        secondView.takeViewController(view: self)
    }
    //arrumar isso
    func setupMapView() {
        super.viewDidLoad()
        view.addSubview(mapView)
        addChild(secondView)
        view.addSubview(secondView.view)
        setupMapViewConstraints()
    }
    
    func setupMapViewConstraints() {
        
        secondView.view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        secondView.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        secondView.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        secondView.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        NSLayoutConstraint.activate([
            mapView.heightAnchor.constraint(equalTo: self.view.heightAnchor),
            mapView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            mapView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            mapView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)])
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "MyMarker")
        annotationView.markerTintColor = UIColor.blue
        return annotationView
    }
    
}
