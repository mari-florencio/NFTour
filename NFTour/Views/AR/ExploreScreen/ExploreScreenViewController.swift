//
//  ExploreScreenViewController.swift
//  NFTour
//
//  Created by Guilerme Barciki on 25/11/21.
//

import Foundation
import UIKit
import CoreLocation

class ExploreScreenViewController: UIViewController {
    var arView = ARView()
    let arServices = ARServices()
    let profile = Model().profile
    let localizationServices = LocalizationServices()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
       print("heading \( localizationServices.getCompassHeading())")
        let seconds = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) { [self] in
            loadNFTs()
            
        }
    }
    
    override func loadView() {
        view = arView
    }
    
    func loadNFTs(){
        let nftList = profile.nfts
        for nft in nftList {
            
            if localizationServices.isNFTnear(nftCoordinate: nft.coordinates) {
                arServices.placeAssetByGeoCoordinates(arView: arView.arSceneView, asset: UIImage(imageLiteralResourceName: nft.image), coordinates: nft.coordinates)
            } else {
                print("vector: nft longe")
            }
        }
    }
}
