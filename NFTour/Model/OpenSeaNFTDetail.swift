//
//  OpenSeaNFTDetail.swift
//  NFTour
//
//  Created by Gustavo Tatarem on 25/11/21.
//

import Foundation

class OpenSeaNFTDetail: Codable {
    let id: Int
    let tokenId: String
    let imageUrl: String
    let name: String
    let description: String?
    let assetContract: AssetContract
    let permalink: String
    let owner: Owner
    let creator: Creator
    let lastSale: LastSale
}

class Owner: Codable {
    let user: User
    let profileImgUrl: String
    let address: String
}

class Creator: Codable {
    let user: User
    let profileImgUrl: String?
    let address: String?
}

class User: Codable {
    let username: String?
}

class LastSale: Codable {
    let totalPrice: String
    let paymentToken: PaymentToken
}

class PaymentToken: Codable {
    let symbol: String
}
