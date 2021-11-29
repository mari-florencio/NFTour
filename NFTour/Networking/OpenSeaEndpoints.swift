//
//  OpenSeaEndpoints.swift
//  NFTour
//
//  Created by Gustavo Tatarem on 25/11/21.
//

import Foundation
import Moya

enum OpenseaEndpoints {
    case getNFTs(ownerId: String)
    case getNFTDetail(assetContractAddress: String, tokenId: String)
}

extension OpenseaEndpoints: TargetType {
    
    var baseURL: URL { return URL(string: "https://api.opensea.io/api/v1")! }
    
    var path: String {
        switch self {
        case .getNFTs:
            return "/assets"
        case .getNFTDetail(let contract, let id):
            return "/asset/\(contract)/\(id)/"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getNFTs, .getNFTDetail:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getNFTs(let id):
            return .requestParameters(parameters: [
                "owner": id,
                "order_direction": "desc",
                "offset": 0,
                "limit": 50],
                encoding: URLEncoding.queryString)
        case .getNFTDetail:
            return .requestPlain
        }
    }
    
    var sampleData: Data {
        return "Half measures are as bad as nothing at all.".utf8Encoded
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
}

extension String {
    var urlEscaped: String { addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)! }
    var utf8Encoded: Data { data(using: .utf8)! }
    
}
