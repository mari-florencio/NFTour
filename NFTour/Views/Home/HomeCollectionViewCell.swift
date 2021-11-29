//
//  HomeCollectionViewCell.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 15/11/21.
//

import UIKit
import CoreLocation
import Kingfisher

class HomeCollectionViewCell: UICollectionViewCell {
    
    
    private lazy var nftImage = UIImageView()
    private var nftSelected: OpenSeaNFT?
    


    // MARK: - Properties

    static let cellId = "CarouselCell"

    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
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
    public func configure(nft: OpenSeaNFT) {
        self.nftSelected = nft
        let url = URL(string: nft.imageUrl)
        nftImage.kf.setImage(with: url)
    }
}
