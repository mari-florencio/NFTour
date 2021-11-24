//
//  TabBarFakeViewController.swift
//  NFTour
//
//  Created by Guilerme Barciki on 23/11/21.
//

import Foundation
import UIKit

class TabBarFakeViewController: UIViewController {
    private var profile = Model().profile
    private var cameraButton = UIButton(frame: CGRect(x: 0, y: 0, width: 73, height: 73))
    private var homeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 73, height: 73))
    private var mapButton = UIButton(frame: CGRect(x: 0, y: 0, width: 73, height: 73))
    lazy var backgroundRectangle: UIView  = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "darkGray")
        return view
    }()
    
    
    private let isParentHomeGallery: Bool
    
    init(isParentHomeGallery: Bool) {
        self.isParentHomeGallery = isParentHomeGallery
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupConstraints()

    }
    
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    
    func setupHierarchy() {
        view.addSubview(backgroundRectangle)
        view.addSubview(cameraButton)
        view.addSubview(homeButton)
        view.addSubview(mapButton)
    }
    
    
    func setupButtons() {
        setupCameraButton()
        setupHomeButton()
        setupMapButton()
    }
    func setupConstraints() {
        let screenWidth = UIScreen.main.bounds.width
       setupButtons()
        backgroundRectangle.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(91)
        }
        let backgroundRectangleHeight = backgroundRectangle.bounds.height
        cameraButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(73)
            make.width.equalTo(73)
        }
        
        homeButton.snp.makeConstraints { make in
            make.centerY.equalTo(backgroundRectangle.snp.top).offset(32)
            make.leading.equalTo(screenWidth/5)
           
        }
        
        mapButton.snp.makeConstraints { make in
            make.centerY.equalTo(homeButton.snp.centerY)
            
            make.trailing.equalTo(-screenWidth/5)
            
        }
        
    }
    
    func setupCameraButton() {
        
        let configuration = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 24, weight: .medium))
        cameraButton.setImage(UIImage(systemName: "camera", withConfiguration: configuration), for: .normal)
        cameraButton.backgroundColor = UIColor(named: "red")
        cameraButton.layer.cornerRadius = cameraButton.frame.height / 2
        cameraButton.tintColor = .white
        
        cameraButton.addTarget(self, action: #selector(cameraButtonPressed(_sender:)), for: .touchUpInside)
    }
    
    func setupHomeButton() {
        let configuration = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 24, weight: .medium))
        homeButton.setImage(UIImage(systemName: "magazine", withConfiguration: configuration), for: .normal)
        homeButton.tintColor = .white
        if isParentHomeGallery  {
            return
        }
        homeButton.addTarget(self, action: #selector(homeButtonPressed(_sender:)), for: .touchUpInside)
       
    }
    
    func setupMapButton() {
        let configuration = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 24, weight: .medium))
        mapButton.setImage(UIImage(systemName: "map", withConfiguration: configuration), for: .normal)
        mapButton.tintColor = .white
        mapButton.addTarget(self, action: #selector(mapButtonPressed(_sender:)), for: .touchUpInside)
    }
    
    @objc func cameraButtonPressed(_sender: UIButton!) {
        let newViewController = ARViewController()
        let navigationController = UINavigationController(rootViewController: newViewController)
        navigationController.modalPresentationStyle = .custom
        self.present(navigationController, animated: true, completion: nil)
    }
    @objc func homeButtonPressed(_sender: UIButton!) {
        let newViewController = HomeGalleryViewController(profile: Model().profile)
        let navigationController = UINavigationController(rootViewController: newViewController)
        navigationController.modalPresentationStyle = .custom
        self.present(navigationController, animated: true, completion: nil)
    }
    
    @objc func mapButtonPressed(_sender: UIButton!) {
        let newViewController = MapViewController()
        let navigationController = UINavigationController(rootViewController: newViewController)
        navigationController.modalPresentationStyle = .custom
        self.present(navigationController, animated: true, completion: nil)
    }
    
}
