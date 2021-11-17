//
//  InformationNFTViewController.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 16/11/21.
//

import UIKit

class InformationNFTViewController: UIViewController {

    private var nft: NFT
    
    private lazy var imageNFT: UIImageView = {
        let imageNFT = UIImageView()
        imageNFT.image = UIImage(named: nft.image)
        imageNFT.contentMode = .scaleAspectFill
        
        return imageNFT
    }()
    
    private lazy var headerStack: UIStackView = {
        let name = UILabel()
        name.text = nft.name
        name.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        name.textColor = UIColor(named: "textColor")
        
        
        let cardPrice = PriceNFTView.init(price: nft.price)
        
        let headerStack = UIStackView(arrangedSubviews: [name, cardPrice])
        headerStack.axis = .horizontal
        headerStack.spacing = 54
        
        return headerStack
    }()
    
    private lazy var descriptionText: UILabel = {
        let description = UILabel()
        description.text = nft.description
        description.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        description.textColor = UIColor(named: "textColor")
        description.numberOfLines = 4
        description.lineBreakMode = .byWordWrapping
        
        return description
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupConstraints()
    }
    
    init(nftSelected: NFT){
        self.nft = nftSelected
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        view.backgroundColor = UIColor(named: "backgroundColor")
  
    }
    private func setupHierarchy() {
        // Adiciona botões como subview
        //addSubview(background)
        view.addSubview(imageNFT)
        view.addSubview(headerStack)
        view.addSubview(descriptionText)
    }
    
    private func setupConstraints() {
        imageNFT.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(421)
            make.width.equalToSuperview()
            
        }
        
        headerStack.snp.makeConstraints { make in
            make.top.equalTo(imageNFT.snp.bottom).offset(23)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-15)
            
        }
        
        descriptionText.snp.makeConstraints { make in
            make.top.equalTo(headerStack.snp.bottom).offset(18)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-15)
            
        }
    
    }
}
