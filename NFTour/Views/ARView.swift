//
//  ARView.swift
//  NFTour
//
//  Created by Alessandra Fernandes Lacerda on 18/11/21.
//

import UIKit
import ARKit

class ARView: UIView, ARSCNViewDelegate {
    
    // MARK: - AR Components
    public var arSceneView: ARSCNView = {
       var view = ARSCNView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    var arSession = ARSession()
    private let arConfiguration = ARWorldTrackingConfiguration()
    
    
    // MARK: - Buttons
    
    var infoButton: UIButton = {
        let button = UIButton()

        button.backgroundColor = .clear
        //button.setTitle("Add Asset", for: .normal)
        button.setImage(UIImage(systemName: "info.circle"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // MARK: - Initialization

    init() {
        super.init(frame: .zero)
        arSceneView.session = arSession
        arSceneView.delegate = self
        arSceneView.autoenablesDefaultLighting = true
        arSceneView.automaticallyUpdatesLighting = true
        arSession.run(arConfiguration)
        
        addSubviews()
        constraintSubviews()
        
        
    }

    required init?(coder: NSCoder) {
        fatalError("This should not be called")
    }

    func addSubviews() {
        addSubview(arSceneView)
        addSubview(infoButton)
    }

    func constraintSubviews() {
        NSLayoutConstraint.activate([
            arSceneView.topAnchor.constraint(equalTo: topAnchor),
            arSceneView.leadingAnchor.constraint(equalTo: leadingAnchor),
            arSceneView.trailingAnchor.constraint(equalTo: trailingAnchor),
            arSceneView.bottomAnchor.constraint(equalTo: bottomAnchor),
            infoButton.heightAnchor.constraint(equalToConstant: 40),
            infoButton.widthAnchor.constraint(equalToConstant: 40),
            infoButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            infoButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
        ])
    }
}
