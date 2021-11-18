//
//  ARServices.swift
//  NFTour
//
//  Created by Alessandra Fernandes Lacerda on 18/11/21.
//

import Foundation
import CoreLocation
import ARKit

final class ARServices {
    
    func placeAsset(arView: ARSCNView, asset: UIImage) {
        
        // MARK: - Image scale
        let width: CGFloat = 0.3
        let height: CGFloat = 0.3 * (asset.size.height/asset.size.width)
        
        
        // MARK: - Creates node
        let node = SCNNode(geometry: SCNBox(width: width, height: height, length: 0.1, chamferRadius: 0))
        
        
        // MARK: - Asset Placement
        let billboardConstraints = SCNBillboardConstraint()
        billboardConstraints.freeAxes = SCNBillboardAxis.Y
        node.constraints = [billboardConstraints]
        
        guard let currentFrame = arView.session.currentFrame else { return }
        
        var translation = matrix_identity_float4x4
        translation.columns.3.z = -1
        
        let transform = currentFrame.camera.transform
        let sceneTransform = matrix_multiply(transform, translation)
        
        node.transform = SCNMatrix4(sceneTransform)
        
        
        // MARK: - Add image to node
        node.geometry?.firstMaterial?.diffuse.contents = asset
        
        
        // MARK: - Add node to scene
        arView.scene.rootNode.addChildNode(node)
        
        
        // MARK: - Set coordinates
        let arCoordinates = node.position
        
        print("posicao: \(LocalizationServices().convertToGeoCoord(arCoodinates: arCoordinates, userCoordinate: CLLocation(latitude: -25.386008, longitude: -49.220696), degree: 0))")
        
        
    }
    
}