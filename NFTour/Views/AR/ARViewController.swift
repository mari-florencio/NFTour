//
//  AR.swift
//  NFTour
//
//  Created by Alessandra Fernandes Lacerda on 18/11/21.
//

import UIKit
import ARKit
import Kingfisher

enum ARState {
    case notPlaced
    case placed
}

class ARViewController: UIViewController {
    
    var nftId: String = ""
    var arView = ARView()
    let arServices = ARServices()
    public var state: ARState = .notPlaced
    public var coordinates: [Double]!
    public var idNFT: String = "StringTeste"
    
    private lazy var positionLabel: UILabel = {
        let label = UILabel()
        label.text = "Tap the screen to place"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.backgroundColor = UIColor(named: "gray")!.withAlphaComponent(0.3)
        label.layer.cornerRadius = 13
        label.clipsToBounds = true
        
        return label
    }()
    
    private lazy var positionImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "placeNFT")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    private lazy var confirmationLabel: UILabel = {
        let label = UILabel()
        label.text = "NFT placed!"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.backgroundColor = UIColor(named: "gray")!.withAlphaComponent(0.3)
        label.layer.cornerRadius = 13
        label.clipsToBounds = true
        
        return label
    }()
  
    private lazy var backButton: BackButton = .makeBackButton(placeholder: "Back", textColor: UIColor.white)
    private lazy var nft: OpenSeaNFTDetail = DefaultOpenSeaRepository.shared.nftDetailCache.get(withKey: nftId)!
    
    override func loadView() {
        view = arView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapView(_:)))
        view.addGestureRecognizer(tap)
        
        displayPosition()
        
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftItemsSupplementBackButton = true
    }
    
    func displayPosition() {
        view.addSubview(positionImage)
        view.addSubview(positionLabel)
        positionImage.snp.makeConstraints { make in
            make.height.equalTo(74)
            make.width.equalTo(178)
            make.center.equalTo(self.view)
            
        }
        
        positionLabel.snp.makeConstraints { make in
            make.top.equalTo(positionImage.snp.bottom).offset(48)
            make.height.equalTo(52)
            make.leading.equalToSuperview().offset(34)
            make.trailing.equalToSuperview().offset(-34)
            
        }
    }
    
    private func displayConfirmation() {
        view.addSubview(confirmationLabel)
        
        confirmationLabel.snp.makeConstraints { make in
            make.center.equalTo(view.center)
            make.height.equalTo(52)
            make.leading.equalToSuperview().offset(34)
            make.trailing.equalToSuperview().offset(-34)
            
        }
    }
    private func displayModal() {
        let newViewController = ConfirmationModalViewController()
        newViewController.mainViewController = self
        let navigationController = UINavigationController(rootViewController: newViewController)
        navigationController.modalPresentationStyle = .custom
        self.present(navigationController, animated: true, completion: nil)
    }
    
    @objc func didTapView(_ sender: UITapGestureRecognizer) {
        
        if state == .notPlaced {
            positionImage.removeFromSuperview()
            positionLabel.removeFromSuperview()
            state = .placed
            var imageView = UIImageView()
            let url = URL(string: nft.imageUrl)
            imageView.kf.setImage(with: url)
            
            coordinates = arServices.placeAsset(arView: arView.arSceneView, asset: imageView.image!)
            displayModal()
        } else {
            self.presentingViewController?.dismiss(animated: false, completion: nil)
        }
        
    }
    
    @objc func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func clearARView() {
        arServices.clearARView(arView: arView.arSceneView)
        state = .notPlaced
        displayPosition()
    }
    
    func saveLocation() {
        //print("aqui: \(coordinates)")
        LocalDataService().saveNFTLocation(id: nft.tokenId, latitude: coordinates[0], longitude: coordinates[1])
        print("coordinates: \(coordinates)")
        displayConfirmation()
    }
}
