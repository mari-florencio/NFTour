//
//  ViewController.swift
//  NFTour
//
//  Created by Mariana Florencio on 10/11/21.
//

import UIKit
import SnapKit
import CoreLocation

class OnbordingHomeViewController: UIViewController, CLLocationManagerDelegate  {
    
    private var locationManager = CLLocationManager()
    private var iconButton = IconButton.createButtonShowMore(size: 30, weight: .regular)
    
    private lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.image = UIImage.gifImageWithName("gifNFT")
        
        return backgroundImage
    }()
    
    private lazy var logo: UIImageView = {
        let logoViewImage = UIImageView()
        logoViewImage.image = UIImage(named: "logoVermelha")
        logoViewImage.contentMode = .scaleAspectFit
        
        return logoViewImage
    }()
    
    private lazy var stackTitle: UIStackView = {
        let title = UILabel()
        title.text = "That's how we get tangible"
        title.textColor = UIColor(named: "textColor")
        title.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        title.numberOfLines = 2
        title.textAlignment = .left
        
        iconButton.snp.makeConstraints { make in
            make.height.equalTo(22)
            make.width.equalTo(30)
        }
        
        let stack = UIStackView(arrangedSubviews: [title, iconButton])
        stack.axis = .horizontal
        stack.spacing = 114
        
        return stack
    }()

    @objc func pressed(_sender: UIButton!) {
        let newViewController = AddressWalletViewController()
        let navigationController = UINavigationController(rootViewController: newViewController)
        navigationController.modalPresentationStyle = .custom
        self.present(navigationController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestUserGPSAuthorization()
        setupView()
        setupHierarchy()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setupHierarchy() {
        // Adiciona botões como subview
        //addSubview(background)
        view.addSubview(backgroundImage)
        view.addSubview(logo)
        view.addSubview(stackTitle)
    }
    
    private func setupView(){
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        iconButton.addTarget(self, action: #selector(pressed(_sender:)), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.height.equalTo(521)
            make.width.equalTo(view.snp.width)
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        logo.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(156)
            make.top.equalTo(backgroundImage.snp.bottom).offset(57)
            make.leading.equalTo(25)
            make.trailing.equalTo(-195)
        }
        
        stackTitle.snp.makeConstraints { make in
            make.top.equalTo(logo.snp.bottom).offset(66)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
            make.height.equalTo(60)
        }
    }
    private func requestUserGPSAuthorization() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.allowsBackgroundLocationUpdates
    }

}

