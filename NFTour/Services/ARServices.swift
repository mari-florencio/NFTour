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
    let localizationServices = LocalizationServices()
    let conversionServices = ConversionServices()
    
    func placeAsset(arView: ARSCNView, asset: UIImage) -> [Double]{
        
        // MARK: - Image scale
        let width: CGFloat = 0.3
        let height: CGFloat = 0.3 * (asset.size.height/asset.size.width)
        
        
        // MARK: - Creates node
        let node = SCNNode(geometry: SCNBox(width: width, height: height, length: 0.02, chamferRadius: 0))
             
        
        // MARK: - Asset Placement
        let billboardConstraints = SCNBillboardConstraint()
        billboardConstraints.freeAxes = SCNBillboardAxis.Y
        node.constraints = [billboardConstraints]
        
        guard let currentFrame = arView.session.currentFrame else { return [] }
        
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
        
        let userCoordinates = localizationServices.getUserLocation()
        
        let geoCoordinates = conversionServices.convertToGeoCoord(arCoodinates: arCoordinates, userCoordinate: userCoordinates, degree: localizationServices.getCompassHeading())
        
        let coordinates = conversionServices.convertCLLocationToDouble(coordinates: geoCoordinates)
        print("heading: \(localizationServices.getCompassHeading())")
        return coordinates
        
//        print("posicao: \(conversionServices.convertToGeoCoord(arCoodinates: arCoordinates, userCoordinate: userCoordinates, degree: localizationServices.getCompassHeading()))")
        
       
        
    }
    
    func placeAssetByGeoCoordinates (arView: ARSCNView, asset: UIImage, coordinates: CLLocation) {
        
        // MARK: - Image scale
        let width: CGFloat = 0.3
        let height: CGFloat = 0.3 * (asset.size.height/asset.size.width)
        
        
        // MARK: - Creates node
        let node = SCNNode(geometry: SCNBox(width: width, height: height, length: 0.1, chamferRadius: 0))
        let positionVector = conversionServices.convertoToARCoordinates(userCoordinate: localizationServices.getUserLocation(), coord2: coordinates, coord2Altitude: 904, degrees:localizationServices.getCompassHeading())
        
        print("vector: \(positionVector)")
        
        
        // MARK: - Asset Placement
        let billboardConstraints = SCNBillboardConstraint()
        billboardConstraints.freeAxes = SCNBillboardAxis.Y
        node.constraints = [billboardConstraints]

        guard let currentFrame = arView.session.currentFrame else {
            fatalError("currentFrame not work")
        }

        var translation = matrix_identity_float4x4
        translation.columns.3.z = -1

        let transform = currentFrame.camera.transform
        let sceneTransform = matrix_multiply(transform, translation)

        node.transform = SCNMatrix4(sceneTransform)
        node.position = positionVector
        print("heading 2: \(localizationServices.getCompassHeading())")
        // MARK: - Add image to node
        node.geometry?.firstMaterial?.diffuse.contents = asset
        
        
        // MARK: - Add node to scene
        arView.scene.rootNode.addChildNode(node)
     
    }
    
    func clearARView(arView: ARSCNView) {
        arView.scene.rootNode.enumerateChildNodes({ (node, stop) in
            node.removeFromParentNode()
        })
    }
}
