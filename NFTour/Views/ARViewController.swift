//
//  AR.swift
//  NFTour
//
//  Created by Alessandra Fernandes Lacerda on 18/11/21.
//

import UIKit
import ARKit

class ARViewController: UIViewController {
    
    private var arView = ARView()

    override func loadView() {
        view = arView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapView(_:)))
        view.addGestureRecognizer(tap)

    }
    
    @objc func didTapView(_ sender: UITapGestureRecognizer) {
        ARServices().placeAsset(arView: arView.arSceneView, asset: UIImage(named: "nft1")!)
    }
}
