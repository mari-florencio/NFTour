//
//  HomeCollectionViewCell.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 15/11/21.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    
    private lazy var nftImage = UIImageView()
    //private var nftSelected: NFT


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
    
//    @objc func didTapHeartButton(){
//        guard let controller = Model.shared.actualController else {
//            return
//        }
//        contentView.addSubview(heartButtonFill)
//        heartButtonFill.snp.makeConstraints{
//            $0.top.equalTo(imageView.snp.top).offset(11)
//            $0.leading.equalTo(imageView.snp.leading).offset(118)
//            $0.trailing.equalTo(imageView.snp.trailing).offset(-8)
//            $0.bottom.equalTo(imageView.snp.bottom).offset(-115)
//
//        }
//
//        let rootVc = AddArtworkTableViewController(artwork: artworkSelected)
//        rootVc.modalPresentationStyle = .fullScreen
//        let navVC = UINavigationController(rootViewController: rootVc)
//        controller.present(navVC, animated: true, completion: nil)
//    }
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
         
        
//        heartButton.addTarget(self, action: #selector(didTapHeartButton), for: .touchUpInside)
        
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
    
//    public func identifyArtwork(nft: NFT){
//        nftSelected = nft
//    }


}
