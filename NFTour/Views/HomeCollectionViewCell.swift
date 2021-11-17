//
//  HomeCollectionViewCell.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 15/11/21.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    
    private lazy var nftImage = UIImageView()
    private var nftSelected: NFT


    // MARK: - Properties

    static let cellId = "CarouselCell"

    // MARK: - Initializer

    override init(frame: CGRect) {
        nftSelected = NFT(id: UUID().uuidString, image: "", name: "", price: 0 , properties: "", description: "", creator: "")
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        nftSelected = NFT(id: UUID().uuidString, image: "", name: "", price: 0 , properties: "", description: "", creator: "")
        super.init(coder: coder)
        setupUI()
    }
}

// MARK: - Setups

private extension HomeCollectionViewCell {
    func setupUI() {
        backgroundColor = .clear

        contentView.addSubview(nftImage)
        nftImage.contentMode = .scaleAspectFill
        nftImage.clipsToBounds = true
        nftImage.layer.cornerRadius = 20
        nftImage.isUserInteractionEnabled = false
        
        nftImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - Public

extension HomeCollectionViewCell {
    public func configure(nft: NFT) {
        nftImage.image = UIImage(named: nft.image)
    }
    
    public func identifyNFT(nft: NFT){
        nftSelected = nft
    }


}
