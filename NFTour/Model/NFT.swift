//
//  NFT.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 15/11/21.
//

import Foundation
import UIKit
import CoreLocation

struct NFT: Identifiable {
    var id: String
    let image: String
    let name: String
    let price: Double
    let properties: String
    let description: String
    let creator: String
    let linkOpenSea: String
    let isPositioned: Bool
    let localization: String?
    let coordinates: CLLocation
}

struct ProfileUser {
    let picture: UIImage
    let user: String
    let wallet: String
    let nfts: [NFT]
}
