//
//  HorizontalCollection.swift
//  NFTour
//
//  Created by Guilerme Barciki on 19/11/21.
//

import Foundation

import UIKit

class HorizontalCollection: UIView {

    private var viewController: UIViewController?
    
    struct CollectionData {
        let nft: NFT
    }

    // MARK: - Subviews

    private lazy var carouselCollectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.showsHorizontalScrollIndicator = false
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = .clear
        collection.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.cellId)
        return collection
    }()

    // MARK: - Properties

    private var collectionData = [CollectionData]()
    private var openseaNfts = DefaultOpenSeaRepository.shared.openseaNfts

    init() {
        super.init(frame: .zero)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private enum LayoutMetrics {
        static let leadingCarosel: CGFloat = 18
        static let heightCarosel: CGFloat = 100
    }
}

// MARK: - Setups

private extension HorizontalCollection {
    func setupUI() {
        backgroundColor = .clear
        setupCollectionView()
    }

    func setupCollectionView() {
        backgroundColor = UIColor(named: "backgroundColor")
        let carouselLayout = UICollectionViewFlowLayout()
        carouselLayout.scrollDirection = .horizontal
        //carouselLayout.itemSize = .zero
        carouselLayout.sectionInset = .zero
        carouselCollectionView.collectionViewLayout = carouselLayout
        carouselCollectionView.showsVerticalScrollIndicator = false
        addSubview(carouselCollectionView)
        carouselCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(LayoutMetrics.heightCarosel)
        }
        

    }
}

// MARK: - UICollectionViewDataSource

extension HorizontalCollection: UICollectionViewDataSource,  UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return openseaNfts.count
    }
    
    
    

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.cellId, for: indexPath) as? HomeCollectionViewCell
        else { return UICollectionViewCell() }

        let nft = openseaNfts[indexPath.row]

        cell.configure(nft: nft)

        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let width : CGFloat
//        let height : CGFloat
//
//            width = 120
//            height = 120
//            return CGSize(width: width, height: height)
//
//    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let controller = viewController
        let nft = openseaNfts[indexPath.row]
        DefaultOpenSeaRepository.shared.fetchNFTDetail(assetContractAddress: nft.assetContract.address, tokenId: nft.tokenId) { nftDetail in
            print("nft detail: \(nftDetail)")
            if let nftDetail = nftDetail {
                let navigationController = UINavigationController(rootViewController:InformationNFTViewController(nftSelected: nftDetail, view: .gallery))
                navigationController.modalPresentationStyle = .custom
                controller!.present(navigationController, animated: true, completion: nil)
            } else {
                print("deu erro parceiro")
            }
        }
        
        
       
    }
}

// MARK: - Public

extension HorizontalCollection {
    public func configureView(with data: [CollectionData]) {
        let carouselLayout = UICollectionViewFlowLayout()
        carouselLayout.scrollDirection = .horizontal
        carouselLayout.itemSize = CGSize(width: 100, height: 100)
        //carouselLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        carouselCollectionView.collectionViewLayout = carouselLayout

        collectionData = data
        carouselCollectionView.reloadData()
    }
    
    public func takeViewController(view: UIViewController) {
        viewController = view
    }
}
