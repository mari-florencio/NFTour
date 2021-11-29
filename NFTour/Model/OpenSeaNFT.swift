//
//  OpenSeaNFT.swift
//  NFTour
//
//  Created by Gustavo Tatarem on 25/11/21.
//

import Foundation

class OpenSeaNFTWrapper: Codable {
    let assets: [OpenSeaNFT]
}

class OpenSeaNFT: Codable {
    let id: Int
    let tokenId: String
    let imageUrl: String
    let imageOriginalUrl: String
    let assetContract: AssetContract
    let owner: Owner
}

class AssetContract: Codable {
    let address: String
}
