//
//  HomeGalleryViewController.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 15/11/21.
//

import UIKit

class HomeGalleryViewController: UIViewController {

    private var profile: ProfileUser
    
    private var collectionView: HomeCollection = .init()
    private var collectionData = [HomeCollection.CollectionData]()
    
    private lazy var stackProfile: UIStackView = {
        let image = UIImageView()
        image.image = profile.picture
        image.makeRounded()
        image.contentMode = .scaleAspectFill
        
        image.snp.makeConstraints { make in
            make.height.width.equalTo(58)
        }
        
        let name = UILabel()
        name.text = profile.user
        name.textColor = UIColor(named: "textColor")
        name.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        
        let rectangle = AddressWalletRectangle(address: profile.wallet)
                
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
        
        let buttonShowMore = IconButton.createButtonShowMore()
        
        let secondStack = UIStackView(arrangedSubviews: [stack, buttonShowMore])
        secondStack.axis = .horizontal
        secondStack.spacing = 183
        
        return secondStack
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
        
        collectionView.configureView(with: collectionData)
        collectionView.takeViewController(view: self)
    }
    
    private func setupView(){
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        for nft in profile.nfts {
            collectionData.append(.init(nft: nft))
        }
    }
    private func setupHierarchy() {
        // Adiciona botões como subview
        //addSubview(background)
        view.addSubview(stackProfile)
        view.addSubview(separator)
        view.addSubview(stackGallery)
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        stackProfile.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(109)
            make.leading.equalTo(27)
            make.trailing.equalTo(-140)
            
        }
        
        separator.snp.makeConstraints { make in
            make.top.equalTo(stackProfile.snp.bottom).offset(24)
            make.leading.equalTo(27)
            make.trailing.equalTo(-27)
            make.height.equalTo(1.5)
            
        }
        
        stackGallery.snp.makeConstraints { make in
            make.top.equalTo(separator.snp.bottom).offset(24)
            make.leading.equalTo(27)
            make.trailing.equalTo(-30)
            
        }
        
        collectionView.snp.makeConstraints { make in
            make.height.equalTo(415)
            make.top.equalTo(stackGallery.snp.bottom).offset(22)
            make.leading.equalToSuperview().offset(26)
            make.trailing.equalToSuperview().offset(-27)
        }
        
    }
}
