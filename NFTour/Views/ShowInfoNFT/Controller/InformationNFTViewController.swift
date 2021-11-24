//
//  InformationNFTViewController.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 16/11/21.
//

import UIKit

class InformationNFTViewController: UIViewController {
    
    private var nft: NFT
    private var typeView: TypeView
    
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
    
    private lazy var button: PrincipalButton = PrincipalButton.createButton(placeholder: "Place NFT")
    
    private lazy var backButton: BackButton = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        switch typeView {
        case .gallery:
            backButton = BackButton.makeBackButton(placeholder: "Galery", textColor: UIColor.white)
        case .home:
            backButton = BackButton.makeBackButton(placeholder: "Home", textColor: UIColor.white)
        }
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftItemsSupplementBackButton = true
        
        setupView()
        setupHierarchy()
        setupConstraints()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    init(nftSelected: NFT, view: TypeView){
        self.nft = nftSelected
        self.typeView = view
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func pressed(_sender: UIButton!) {
        let newViewController = ARViewController()
        let navigationController = UINavigationController(rootViewController: newViewController)
        navigationController.modalPresentationStyle = .custom
        self.present(navigationController, animated: true, completion: nil)
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
        }else{
            view.addSubview(button)
        }
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
            make.top.equalTo(imageNFT.snp.bottom).offset(30)
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
                make.top.equalTo(descriptionText.snp.bottom).offset(24)
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
                make.height.equalTo(41)
                
            }
        }
        else{
            button.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
                make.top.equalTo(descriptionText.snp.bottom).offset(24)
            }
            
        }
        
    }
}
