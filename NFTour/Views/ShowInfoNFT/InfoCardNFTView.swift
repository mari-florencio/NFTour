
//  InfoCardNFT.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 16/11/21.
//

import UIKit

class InfoCardNFTView: UIView, UITextViewDelegate {
    
    private var typeInfo: TypeInfoNFT
    
    private lazy var stackTitle: UIStackView = {
        let configuration = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 14, weight: .bold))
        
        let icon = UIImageView()
        icon.image = (typeInfo == .created) ? UIImage(systemName: "paintbrush.fill", withConfiguration: configuration) : UIImage(systemName: "link", withConfiguration: configuration)
        icon.tintColor = UIColor(named:"textColor")
        
        icon.snp.makeConstraints { make in
            make.height.equalTo(17)
            make.width.equalTo(19)
        }
        
        let title = UILabel()
        title.text = (typeInfo == .created) ? "Created by" : "OpenSea"
        
        
        let stack = UIStackView(arrangedSubviews: [icon, title])
        stack.axis = .horizontal
        stack.spacing = 5
        
        return stack
    }()
    
    private lazy var rectangle: UIView = {
        let rectangle = UIView()
        rectangle.backgroundColor = UIColor(named: "darkGray")
        rectangle.layer.cornerRadius = 10
        rectangle.layer.masksToBounds = true
        rectangle.clipsToBounds = true
        
        return rectangle
        
    }()
    
    private lazy var info: UILabel = {
        let info = UILabel()
        info.textColor = .white
        info.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        info.textAlignment = NSTextAlignment.center
        
        return info
    }()
    
    private lazy var infoTextView: UITextView = {
        let info = UITextView()
        info.backgroundColor = UIColor.clear
        info.isEditable = false
        info.isSelectable = true
        return info
    }()
    
    init(infoNFT: String, typeInfo: TypeInfoNFT) {
        self.typeInfo = typeInfo
        super.init(frame: .zero)
        infoTextView.delegate = self
        setupHierarchy()
        setupConstraints()
        
        switch self.typeInfo {
        case .created:
            info.text = "@\(infoNFT)"
        case .linkOpenSea:
            
            infoTextView.hyperLink(originalText: "See more", hyperLink: "See more", urlString: infoNFT)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        // Adiciona botões como subview
        //addSubview(background)
        self.addSubview(stackTitle)
        self.addSubview(rectangle)
        
        
        switch self.typeInfo {
        case .created:
            rectangle.addSubview(info)
        case .linkOpenSea:
            rectangle.addSubview(infoTextView)
        }
        
    }
    
    private func setupConstraints() {
        stackTitle.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        rectangle.snp.makeConstraints { make in
            make.top.equalTo(stackTitle.snp.bottom).offset(10)
            make.height.equalTo(30)
            make.width.equalTo(148)
            make.leading.trailing.equalToSuperview()
        }
        
        switch self.typeInfo {
        case .created:
            info.snp.makeConstraints { make in
                make.top.equalTo(rectangle.snp.top).offset(5)
                make.leading.equalTo(rectangle.snp.leading).offset(12)
                make.trailing.equalTo(rectangle.snp.trailing).offset(-12)
                make.bottom.equalTo(rectangle.snp.bottom).offset(-5)
            }
        case .linkOpenSea:
            infoTextView.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.leading.equalTo(rectangle.snp.leading).offset(12)
                make.trailing.equalTo(rectangle.snp.trailing).offset(-12)
                make.height.equalTo(25)
    
                
            }
        }
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL)
        return true
    }
}

enum TypeInfoNFT {
    case created
    case linkOpenSea
}
