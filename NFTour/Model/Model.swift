//
//  Model.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 15/11/21.
//

import Foundation
import UIKit

class Model: ObservableObject {

    var profile: ProfileUser = ProfileUser (picture: UIImage(named: "profile")!, user: "@maluzeira", wallet: "0x4265de963cdd60629d03fee2cd3285e6d5ff6015",
                                            
        nfts: [
            NFT(id: UUID().uuidString, image: "nft1", name: "Mystical melt", price: 2.55 , properties: "rare", description: "The most abstract NFT collection of all time! 1000 NFTS are made from a combination of over 200 inks, hand-drawn in a specific color mixing technique. The Mystical Melts are active in the Ethereum blockchain in the form of ERC-721 tokens.", creator: "Florence", linkOpenSea: "https://opensea.io/assets/0xbc4ca0eda7647a8ab7c2061c2e118a18a936f13d/9180",isPositioned: true, localization: "Avenida das Árvores, Santa Cândida, Curitiba, Brasil"),
            
            NFT(id: UUID().uuidString, image: "nft2", name: "Duck",  price: 2.55, properties: "rare", description: "The most abstract NFT collection of all time! 1000 NFTS are made from a combination of over 200 inks, hand-drawn in a specific color mixing technique. The Mystical Melts are active in the Ethereum blockchain in the form of ERC-721 tokens.", creator: "Florence", linkOpenSea: "https://opensea.io/assets/0xbc4ca0eda7647a8ab7c2061c2e118a18a936f13d/9180", isPositioned: true, localization: "Avenida das Árvores, Santa Cândida, Curitiba, Brasil"),
            
            NFT(id: UUID().uuidString, image: "nft3", name: "Kong", price: 2.55, properties: "rare", description: "The most abstract NFT collection of all time! 1000 NFTS are made from a combination of over 200 inks, hand-drawn in a specific color mixing technique. The Mystical Melts are active in the Ethereum blockchain in the form of ERC-721 tokens.", creator: "Florence", linkOpenSea: "https://opensea.io/assets/0xbc4ca0eda7647a8ab7c2061c2e118a18a936f13d/9180", isPositioned: true, localization: "Avenida das Árvores, Santa Cândida, Curitiba, Brasil"),
            
            NFT(id: UUID().uuidString, image: "nft4", name: "Crazy NFT", price: 2.55, properties: "rare", description: "The most abstract NFT collection of all time! 1000 NFTS are made from a combination of over 200 inks, hand-drawn in a specific color mixing technique. The Mystical Melts are active in the Ethereum blockchain in the form of ERC-721 tokens.", creator: "Florence", linkOpenSea: "https://opensea.io/assets/0xbc4ca0eda7647a8ab7c2061c2e118a18a936f13d/9180", isPositioned: false, localization: ""),
            
            NFT(id: UUID().uuidString, image: "nft5", name: "Mystical melt", price: 2.55, properties: "rare", description: "The most abstract NFT collection of all time! 1000 NFTS are made from a combination of over 200 inks, hand-drawn in a specific color mixing technique. The Mystical Melts are active in the Ethereum blockchain in the form of ERC-721 tokens.", creator: "Florence", linkOpenSea: "https://opensea.io/assets/0xbc4ca0eda7647a8ab7c2061c2e118a18a936f13d/9180", isPositioned: false, localization: ""),
            
            NFT(id: UUID().uuidString, image: "nft6", name: "Mystical melt", price: 2.55, properties: "rare", description: "The most abstract NFT collection of all time! 1000 NFTS are made from a combination of over 200 inks, hand-drawn in a specific color mixing technique. The Mystical Melts are active in the Ethereum blockchain in the form of ERC-721 tokens.", creator: "Florence", linkOpenSea: "https://opensea.io/assets/0xbc4ca0eda7647a8ab7c2061c2e118a18a936f13d/9180", isPositioned: true, localization: "Avenida das Árvores, Santa Cândida, Curitiba, Brasil"),
            
            NFT(id: UUID().uuidString, image: "nft7", name: "Mystical melt", price: 2.55, properties: "rare", description: "The most abstract NFT collection of all time! 1000 NFTS are made from a combination of over 200 inks, hand-drawn in a specific color mixing technique. The Mystical Melts are active in the Ethereum blockchain in the form of ERC-721 tokens.", creator: "Florence", linkOpenSea: "https://opensea.io/assets/0xbc4ca0eda7647a8ab7c2061c2e118a18a936f13d/9180",isPositioned: false, localization: ""),
            
            NFT(id: UUID().uuidString, image: "nft8", name: "Mystical melt", price: 2.55, properties: "rare", description: "The most abstract NFT collection of all time! 1000 NFTS are made from a combination of over 200 inks, hand-drawn in a specific color mixing technique. The Mystical Melts are active in the Ethereum blockchain in the form of ERC-721 tokens.", creator: "Florence", linkOpenSea: "https://opensea.io/assets/0xbc4ca0eda7647a8ab7c2061c2e118a18a936f13d/9180", isPositioned: false, localization: ""),
            
            NFT(id: UUID().uuidString, image: "nft9", name: "Mystical melt", price: 2.55, properties: "rare", description: "The most abstract NFT collection of all time! 1000 NFTS are made from a combination of over 200 inks, hand-drawn in a specific color mixing technique. The Mystical Melts are active in the Ethereum blockchain in the form of ERC-721 tokens.", creator: "Florence", linkOpenSea: "https://opensea.io/assets/0xbc4ca0eda7647a8ab7c2061c2e118a18a936f13d/9180", isPositioned: false, localization: ""),
            
            NFT(id: UUID().uuidString, image: "nft10", name: "Mystical melt", price: 2.55, properties: "rare", description: "The most abstract NFT collection of all time! 1000 NFTS are made from a combination of over 200 inks, hand-drawn in a specific color mixing technique. The Mystical Melts are active in the Ethereum blockchain in the form of ERC-721 tokens.", creator: "Florence", linkOpenSea: "https://opensea.io/assets/0xbc4ca0eda7647a8ab7c2061c2e118a18a936f13d/9180", isPositioned: false, localization: ""),
            
            NFT(id: UUID().uuidString, image: "nft11", name: "Mystical melt", price: 2.55, properties: "rare", description: "The most abstract NFT collection of all time! 1000 NFTS are made from a combination of over 200 inks, hand-drawn in a specific color mixing technique. The Mystical Melts are active in the Ethereum blockchain in the form of ERC-721 tokens.", creator: "Florence", linkOpenSea: "https://opensea.io/assets/0xbc4ca0eda7647a8ab7c2061c2e118a18a936f13d/9180", isPositioned: true, localization: "Avenida das Árvores, Santa Cândida, Curitiba, Brasil"),
            
            NFT(id: UUID().uuidString, image: "nft12", name: "Mystical melt", price: 2.55, properties: "rare", description: "The most abstract NFT collection of all time! 1000 NFTS are made from a combination of over 200 inks, hand-drawn in a specific color mixing technique. The Mystical Melts are active in the Ethereum blockchain in the form of ERC-721 tokens.", creator: "Florence", linkOpenSea: "https://opensea.io/assets/0xbc4ca0eda7647a8ab7c2061c2e118a18a936f13d/9180", isPositioned: false,  localization: ""),
            
            NFT(id: UUID().uuidString, image: "nft13", name: "Mystical melt", price: 2.55, properties: "rare", description: "The most abstract NFT collection of all time! 1000 NFTS are made from a combination of over 200 inks, hand-drawn in a specific color mixing technique. The Mystical Melts are active in the Ethereum blockchain in the form of ERC-721 tokens.", creator: "Florence", linkOpenSea: "https://opensea.io/assets/0xbc4ca0eda7647a8ab7c2061c2e118a18a936f13d/9180", isPositioned: false, localization: ""),
            
            NFT(id: UUID().uuidString, image: "nft14", name: "Mystical melt", price: 2.55, properties: "rare", description: "The most abstract NFT collection of all time! 1000 NFTS are made from a combination of over 200 inks, hand-drawn in a specific color mixing technique. The Mystical Melts are active in the Ethereum blockchain in the form of ERC-721 tokens.", creator: "Florence", linkOpenSea: "https://opensea.io/assets/0xbc4ca0eda7647a8ab7c2061c2e118a18a936f13d/9180", isPositioned: true, localization: "Avenida das Árvores, Santa Cândida, Curitiba, Brasil"),
            
            NFT(id: UUID().uuidString, image: "nft15", name: "Mystical melt", price: 2.55, properties: "rare", description: "The most abstract NFT collection of all time! 1000 NFTS are made from a combination of over 200 inks, hand-drawn in a specific color mixing technique. The Mystical Melts are active in the Ethereum blockchain in the form of ERC-721 tokens.", creator: "Florence", linkOpenSea: "https://opensea.io/assets/0xbc4ca0eda7647a8ab7c2061c2e118a18a936f13d/9180", isPositioned: true, localization: "Avenida das Árvores, Santa Cândida, Curitiba, Brasil")]
        
        )
}
