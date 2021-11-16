//
//  NFT.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 15/11/21.
//

import Foundation
import UIKit

struct NFT: Identifiable {
    var id: String
    let image: String
    let name: String
    let price: Double
    let properties: String
    let description: String
    let creator: String
}

struct ProfileUser {
    let picture: UIImage
    let user: String
    let wallet: String
    let nfts: [NFT]
}
