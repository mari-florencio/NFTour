//
//  LocalizationServices.swift
//  NFTour
//
//  Created by Guilerme Barciki on 17/11/21.
//

import Foundation
import CoreLocation
import ARKit
import MapKit

final class ConversionServices {
    
    func convertoToARCoordinates(userCoordinate: CLLocation, coord2: CLLocation, coord2Altitude: Double, degrees: Double) -> SCNVector3 {
        // MARK: - converte graus em radianos
        let radian = (degrees * .pi) / 180
        let distanceInMeters = userCoordinate.distance(from: coord2)
        
        // MARK: - Determina distancia em metros no eixo x e z
        let latitude = coord2.coordinate.latitude - userCoordinate.coordinate.latitude
        let longitude = coord2.coordinate.longitude - userCoordinate.coordinate.longitude
        var latMeters = CLLocation(latitude: 0, longitude: 0).distance(from: CLLocation(latitude: latitude, longitude: 0))
        var longMeters = CLLocation(latitude: 0, longitude: 0 ).distance(from: CLLocation(latitude: 0, longitude: longitude))
        // MARK: - Essa operação determina se a distância é negativa ou positiva no plano
        if latitude < 0 {
            latMeters = -latMeters
        }
        if longitude < 0 {
            longMeters = -longMeters
        }
        
        
        // MARK: - Operação de rotação do plano para encontrar coordenada x e z
        let xCoord =  longMeters * cos(radian) + latMeters * sin(radian)
        var zCoord = -longMeters * sin(radian) + latMeters * cos(radian)
            zCoord = -zCoord
        
        let yCoord  = coord2Altitude - userCoordinate.altitude
        
        // MARK: - coloca coordenadas em SCNVector3
        let vector = SCNVector3(xCoord, yCoord, zCoord)
        
        // MARK: - prints para debug
        print(" altidude  \(userCoordinate.altitude)")
        print("latmeters: \(latMeters)  longmeters: \(longMeters)")
        print("distance in meters \(distanceInMeters)")
        print("aqui oo \(latitude)")
        
        return vector
    }
    
    func convertToGeoCoord(arCoodinates: SCNVector3, userCoordinate: CLLocation, degree: Double) -> CLLocation {
      
        // MARK: - constantes
        let earthPerimeter: Double  = (2.0 * .pi) * 6371000.0
        let metersPerDegrees: Double = earthPerimeter / 360.0
        
        // MARK: - converte para radianos e converde Float em Double
        let radian = (degree * .pi) / 180
        let x = Double(arCoodinates.x)
        let z = -Double(arCoodinates.z)
        
        
        // MARK: - Rotaciona o plano e determina lat e long
        var lat = x / metersPerDegrees * cos(radian) - z / metersPerDegrees * sin(radian)
        var long = x / metersPerDegrees * sin(radian) + z / metersPerDegrees * cos(radian)
        lat = lat + userCoordinate.coordinate.latitude
        long = long + userCoordinate.coordinate.longitude
        
        
        print("latitude: \(lat)   longitude \(long)")
        let location = CLLocation(latitude: lat, longitude: long)
        
        print("location: \(location.coordinate)")
        return location
    }
    
}




