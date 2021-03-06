//
//  HomeGalleryViewController.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 15/11/21.
//

import UIKit
import CoreLocation
import MapKit

class HomeGalleryViewController: UIViewController, CLLocationManagerDelegate {

    private var profile = Model().profile
    
    private var collectionView: HomeCollection = .init(typeView: .home)
    private var collectionData = [HomeCollection.CollectionData]()
    private var openseaNfts = DefaultOpenSeaRepository.shared.openseaNfts
    
    private let buttonShowMore = IconButton.createButtonShowMore(size: 20, weight: .bold)
    
    private lazy var stackProfile: UIStackView = {
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: 58, height: 58)
        let url = URL(string: (openseaNfts.first?.owner.profileImgUrl)!)
        image.kf.setImage(with: url)
//        image.image = profile.picture
        image.makeRounded()
        image.contentMode = .scaleAspectFill
        
        image.snp.makeConstraints { make in
            make.height.width.equalTo(58)
        }
        
        let name = UILabel()
        name.text = openseaNfts.first?.owner.user.username
        name.textColor = UIColor(named: "textColor")
        name.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        
        let rectangle = AddressWalletRectangle(address: (openseaNfts.first?.owner.address)!)
                
        let stack = UIStackView(arrangedSubviews: [name, rectangle])
        stack.axis = .vertical
        stack.spacing = 8
        
        let secondStack = UIStackView(arrangedSubviews: [image, stack])
        secondStack.axis = .horizontal
        secondStack.spacing = 13
        
        return secondStack
    }()
    
    private lazy var separator: SeparatorView = SeparatorView.init(frame: .zero)
    
    private lazy var stackGallery: UIStackView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "sparkles", withConfiguration: UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 20, weight: .bold)))
        icon.tintColor = UIColor(named: "red")
        
        icon.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.width.equalTo(20)
        }
        
        let title = UILabel()
        title.text = "your NFTs"
        title.textColor = UIColor(named: "textColor")
        title.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        let stack = UIStackView(arrangedSubviews: [icon, title])
        stack.axis = .horizontal
        stack.spacing = 5
        
        buttonShowMore.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.width.equalTo(15)
        }
        
        let secondStack = UIStackView(arrangedSubviews: [stack, buttonShowMore])
        secondStack.axis = .horizontal
        secondStack.spacing = 183
        
        return secondStack
    }()
    
    private lazy var fakeTabBar: TabBarFakeViewController = {
        let tabBar = TabBarFakeViewController(isParentHomeGallery: true)
        
        tabBar.view.translatesAutoresizingMaskIntoConstraints = false
        return tabBar
    }()
    
    init(profile: ProfileUser){
        self.profile = profile
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupConstraints()
        print("checando aqui: \(self.isKind(of: HomeGalleryViewController.self))")
        collectionView.configureView(with: collectionData)
        collectionView.takeViewController(view: self)
    }
    
    private func setupView(){
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        //colllection
        for nft in profile.nfts {
            collectionData.append(.init(nft: nft))
        }
        
        //button
        buttonShowMore.addTarget(self, action: #selector(pressed(_sender:)), for: .touchUpInside)
    }
    
    
    @objc func pressed(_sender: UIButton!) {
        let newViewController = GalleyViewController(profile: profile)
        let navigationController = UINavigationController(rootViewController: newViewController)
        navigationController.modalPresentationStyle = .custom
        self.present(navigationController, animated: true, completion: nil)
    }
    
    
    private func setupHierarchy() {
        // Adiciona bot??es como subview
        //addSubview(background)
        
        view.addSubview(stackProfile)
        view.addSubview(separator)
        view.addSubview(stackGallery)
        view.addSubview(collectionView)
        addChild(fakeTabBar)
        view.addSubview(fakeTabBar.view)
        
    }
    
    private func setupConstraints() {
        stackProfile.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(109)
            make.leading.equalTo(20)
            make.trailing.equalTo(-148)
            
        }
        
        separator.snp.makeConstraints { make in
            make.top.equalTo(stackProfile.snp.bottom).offset(24)
            make.leading.equalTo(27)
            make.trailing.equalTo(-27)
            make.height.equalTo(1.5)
            
        }
        
        stackGallery.snp.makeConstraints { make in
            make.top.equalTo(separator.snp.bottom).offset(24)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            
        }
        
        collectionView.snp.makeConstraints { make in
            make.height.equalTo(440)
            make.top.equalTo(stackGallery.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(23)
            make.trailing.equalToSuperview().offset(-23)
        }
        
        fakeTabBar.view.snp.makeConstraints { make in
            make.height.equalTo(116)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make .trailing.equalToSuperview()
        }
        
    }
    
    
}
