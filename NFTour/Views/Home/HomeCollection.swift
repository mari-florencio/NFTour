//
//  HomeCollection.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 15/11/21.
//

import UIKit

class HomeCollection: UIView, UICollectionViewDelegate {

    private var viewController: UIViewController?
    private var view: TypeView
    
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

    init(typeView: TypeView) {
        self.view = typeView
        super.init(frame: .zero)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private enum LayoutMetrics {
        static let leadingCarosel: CGFloat = 18
        static let heightCarosel: CGFloat = 410
    }
}

// MARK: - Setups

private extension HomeCollection {
    func setupUI() {
        backgroundColor = .clear
        setupCollectionView()
    }

    func setupCollectionView() {
        backgroundColor = UIColor(named: "backgroundColor")
        let carouselLayout = UICollectionViewFlowLayout()
        
        switch view {
        case .home:
            carouselLayout.scrollDirection = .horizontal
        case .gallery :
            carouselLayout.scrollDirection = .vertical
        }
        carouselLayout.sectionInset = .zero
        carouselCollectionView.collectionViewLayout = carouselLayout
        carouselCollectionView.showsVerticalScrollIndicator = false
        addSubview(carouselCollectionView)
        carouselCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(LayoutMetrics.heightCarosel)
        }
        

    }
}

// MARK: - UICollectionViewDataSource

extension HomeCollection: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch view {
        case .home:
            return 4
        case .gallery :
            return collectionData.count
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.cellId, for: indexPath) as? HomeCollectionViewCell
        else { return UICollectionViewCell() }

        let nft = collectionData[indexPath.row].nft

        cell.configure(nft: nft)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width : CGFloat
        let height : CGFloat
        switch view {
        case .home:
            if indexPath.item == 0 || indexPath.item == 3 {
                // First section
                width = 153
                height = 241
                return CGSize(width: width, height: height)
                
            } else {
                // Second section
                width = 153
                height = 153
                return CGSize(width: width, height: height)
            }
        case .gallery :
            return CGSize(width: 159, height: 163)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                    layout collectionViewLayout: UICollectionViewLayout,
                    minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }

    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let controller = viewController
        let nft = collectionData[indexPath.row].nft
        let navigationController = UINavigationController(rootViewController:InformationNFTViewController(nftSelected: nft, before: .home))
        navigationController.modalPresentationStyle = .custom
        controller!.present(navigationController, animated: true, completion: nil)
       
    }
}

// MARK: - Public

extension HomeCollection {
    public func configureView(with data: [CollectionData]) {
        let carouselLayout = UICollectionViewFlowLayout()
        switch view {
        case .home:
            carouselLayout.scrollDirection = .horizontal
        case .gallery :
            carouselLayout.scrollDirection = .vertical
        }
        carouselLayout.sectionInset = alignmentRectInsets
        carouselCollectionView.collectionViewLayout = carouselLayout

        collectionData = data
        carouselCollectionView.reloadData()
    }
    
    public func loadData(){
        carouselCollectionView.reloadData()
    }
    
    public func takeViewController(view: UIViewController) {
        viewController = view
    }
}

enum TypeView {
    case gallery
    case home
}
