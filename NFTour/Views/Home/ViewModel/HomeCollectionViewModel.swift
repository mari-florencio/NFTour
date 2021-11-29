//
//  HomeCollectionViewModel.swift
//  NFTour
//
//  Created by Gustavo Tatarem on 25/11/21.
//

import Foundation

final class HomeCollectionViewModel {
    var numberOfNFTs = 0
    
    func loadNFTs() {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.opensea.io/api/v1/assets?order_direction=desc&offset=0&limit=20")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
            print(error)
          } else {
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse)
          }
        })

        dataTask.resume()
    }
}
