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
   
    private lazy var backButton: BackButton = .makeBackButton(placeholder: "Voltar", textColor: UIColor.white)
    
    private var placeNFTButton = UIButton(frame: CGRect(x: 0, y: 0, width: 73, height: 73))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //backButton
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftItemsSupplementBackButton = true
        
        //placeNFTButton
        view.addSubview(placeNFTButton)
        setupButton()
        setupConstraints()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
       print("heading \( localizationServices.getCompassHeading())")
        let seconds = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) { [self] in
            loadNFTs()
            
        }
    }
    
    override func loadView() {
        view = arView
    }
    
    func setupButton() {
        let configuration = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 35, weight: .medium))
        placeNFTButton.setImage(UIImage(systemName: "arkit", withConfiguration: configuration), for: .normal)
        placeNFTButton.backgroundColor = UIColor.black
        placeNFTButton.layer.cornerRadius = placeNFTButton.frame.height / 2
        placeNFTButton.tintColor = .white
        
        placeNFTButton.addTarget(self, action: #selector(placeNFTButtonPressed(_sender:)), for: .touchUpInside)
    }
    
    
    @objc func placeNFTButtonPressed(_sender: UIButton!) {
        let newViewController = ARViewController()
        let navigationController = UINavigationController(rootViewController: newViewController)
        navigationController.modalPresentationStyle = .custom
        self.present(navigationController, animated: true, completion: nil)
    }
    
    func setupConstraints() {
        let screenWidth = UIScreen.main.bounds.width
        placeNFTButton.snp.makeConstraints { make in
            make.centerY.equalTo(view.snp.bottom).offset(-72)
            make.trailing.equalTo(-20)
            make.height.equalTo(73)
            make.width.equalTo(73)
           
        }
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
    
    @objc func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
