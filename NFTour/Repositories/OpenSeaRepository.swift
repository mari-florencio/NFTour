//
//  OpenSeaRepository.swift
//  NFTour
//
//  Created by Gustavo Tatarem on 25/11/21.
//

import Foundation

protocol OpenSeaRepository {
    func fetchNFTs(ownerId: String, _ closure: @escaping ([OpenSeaNFT]?) -> Void)
    func fetchNFTDetail(assetContractAddress: String, tokenId: String, _ closure: @escaping (OpenSeaNFTDetail?) -> Void)
}

class DefaultOpenSeaRepository: OpenSeaRepository {
    static let shared = DefaultOpenSeaRepository()
    let service = APIOpenSeaService()
    var openseaNfts: [OpenSeaNFT] = []
    var nftsCache: [String: [OpenSeaNFT]] = [:]
    var nftDetailCache = Cache<String, OpenSeaNFTDetail>(
        identifiedBy: {$0.tokenId},
        expirationTime: 600
    )
    
    private init() {
        
    }
    
    func fetchNFTs(ownerId: String, _ closure: @escaping ([OpenSeaNFT]?) -> Void) {
        if let nfts = nftsCache[ownerId] {
            closure(nfts)
            return
        }
        
        service.getNFTs(ownerId: ownerId) { nfts in
            self.nftsCache[ownerId] = nfts
            print("NFTS map: \(nfts!.map({$0.imageOriginalUrl}))")
            self.openseaNfts = nfts!.filter({$0.imageOriginalUrl.hasSuffix(".png") || $0.imageUrl.hasSuffix(".jpg") || $0.imageUrl.hasSuffix(".jpeg")})
            print("OPENSEA NFTS MAP: \(self.openseaNfts.map({$0.imageOriginalUrl}))")
            
            
            closure(nfts)
        }
    }
    
    func fetchNFTDetail(assetContractAddress: String, tokenId: String, _ closure: @escaping (OpenSeaNFTDetail?) -> Void) {
        if let nftDetail = nftDetailCache.get(withKey: tokenId) {
            closure(nftDetail)
            return
        }
        
        service.getNFTDetail(assetContractAddress: assetContractAddress, tokenId: tokenId) { nftDetail in
            if let nftDetail = nftDetail {
                self.nftDetailCache.update(nftDetail)
            }
            
            closure(nftDetail)
        }
    }
    
}
