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
        imageNFT.contentMode = .scaleToFill
        
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
    
    private lazy var secondStack: UIStackView = {
        let createBy = InfoCardNFTView.init(infoNFT: nft.creator, typeInfo: .created)
        
        let link = InfoCardNFTView.init(infoNFT: nft.linkOpenSea, typeInfo: .linkOpenSea)
        
        let stack = UIStackView(arrangedSubviews: [createBy,link])
        stack.axis = .horizontal
        stack.spacing = 30
        
        
        return stack
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
    
    private lazy var localization : LocalizationNFTView = .init(localization: nft.localization!)
    
    private lazy var button: PrincipalButton = PrincipalButton.createButton(placeholder: "Posicionar NFT")

    @objc func pressed(_sender: UIButton!) {
        let newViewController = ARViewController()
        let navigationController = UINavigationController(rootViewController: newViewController)
        navigationController.modalPresentationStyle = .custom
        self.present(navigationController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupConstraints()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
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
        button.addTarget(self, action: #selector(pressed(_sender:)), for: .touchUpInside)
  
    }
    private func setupHierarchy() {
        // Adiciona botões como subview
        //addSubview(background)
        view.addSubview(imageNFT)
        view.addSubview(headerStack)
        view.addSubview(secondStack)
        view.addSubview(descriptionText)
        
        if nft.isPositioned{
            view.addSubview(localization)
        }
        
        view.addSubview(button)
        
    }
    
    private func setupConstraints() {
        imageNFT.snp.makeConstraints { make in
            make.height.equalTo(421)
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalToSuperview()
            
        }
        
        headerStack.snp.makeConstraints { make in
            make.top.equalTo(imageNFT.snp.bottom).offset(23)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-15)
            
        }
        
        secondStack.snp.makeConstraints { make in
            make.top.equalTo(headerStack.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(45)
            
        }
        
        descriptionText.snp.makeConstraints { make in
            make.top.equalTo(secondStack.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)

        }
        
        if nft.isPositioned{
            localization.snp.makeConstraints { make in
                make.top.equalTo(descriptionText.snp.bottom).offset(21)
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
                make.height.equalTo(41)

            }
        }
        
        button.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            
            if nft.isPositioned{
                make.top.equalTo(localization.snp.bottom).offset(25)
            }else{
                make.top.equalTo(descriptionText.snp.bottom).offset(47)
            }
        }
        
        
        
    
    }
}
