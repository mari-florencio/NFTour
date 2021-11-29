//
//  OpenSeaService.swift
//  NFTour
//
//  Created by Gustavo Tatarem on 25/11/21.
//

import Foundation
import Moya

protocol OpenSeaService {
    func getNFTs(ownerId: String, _ closure: @escaping ([OpenSeaNFT]?) -> Void)
    func getNFTDetail(assetContractAddress: String, tokenId: String, _ closure: @escaping (OpenSeaNFTDetail?) -> Void)
}

class APIOpenSeaService: OpenSeaService {
    let provider = MoyaProvider<OpenseaEndpoints>()
    
    func getNFTs(ownerId: String, _ closure: @escaping ([OpenSeaNFT]?) -> Void) {
        provider.request(.getNFTs(ownerId: ownerId)) { result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                do {
                    try decoder.decode(OpenSeaNFTWrapper.self, from: data)
                } catch {
                    print("Decoding error: \(error.localizedDescription)")
                }
                let wrapper = try? decoder.decode(OpenSeaNFTWrapper.self, from: data)
                closure(wrapper?.assets)
            case let .failure(error):
                print("API error: \(error.localizedDescription)")
                closure(nil)
            }
        }
    }
    
    func getNFTDetail(assetContractAddress: String, tokenId: String, _ closure: @escaping (OpenSeaNFTDetail?) -> Void) {
        provider.request(.getNFTDetail(assetContractAddress: assetContractAddress, tokenId: tokenId)) { result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                do {
                    print(data)
                    try decoder.decode(OpenSeaNFTDetail.self, from: data)
                } catch {
                    print("API error: \(error)")
                }
                let nftDetail = try? decoder.decode(OpenSeaNFTDetail.self, from: data)
                
                print("nft detail: \(nftDetail)")
                closure(nftDetail)
            case let .failure(error):
                print("API error: \(error.localizedDescription)")
                closure(nil)
            }
        }
    }
}
