//
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
        icon.image = (typeInfo == .created) ? UIImage(named: "paintbrush.fill") : UIImage(named: "link")
        icon.image?.withConfiguration(configuration)
        icon.tintColor = UIColor(named: "textColor")
        
        icon.snp.makeConstraints { make in
            make.height.equalTo(17)
            make.width.equalTo(19)
        }
        
        let title = UILabel()
        title.text = (typeInfo == .created) ? "Criado por" : "OpenSea"
        
        
        let stack = UIStackView(arrangedSubviews: [icon, title])
        stack.axis = .horizontal
        stack.spacing = 5
        
        return stack
    }()
    
    private lazy var rectangle: UIView = {
        let rectangle = UIView()
        rectangle.backgroundColor = UIColor(named: "red")
        rectangle.layer.cornerRadius = 20
        rectangle.layer.masksToBounds = false
        rectangle.clipsToBounds = true
        
        return rectangle
        
    }()
    
    private lazy var info: UILabel = {
        let info = UILabel()
        info.textColor = .white
        info.font = UIFont.systemFont(ofSize: 12, weight: .regular)
       
        return info
    }()
    
    private lazy var infoTextView: UITextView = {
        let info = UITextView()
        info.textColor = .white
        info.font = UIFont.systemFont(ofSize: 12, weight: .regular)
       
        return info
    }()
    
    private override init(frame: CGRect) {
        self.typeInfo = .created
        super.init(frame: frame)
        setupHierarchy()
        setupConstraints()
    }
    
    convenience init(createdBy: String, openSea: TypeInfoNFT) {
        self.init(frame: .zero)
        self.typeInfo = typeInfo
        
        switch typeInfo {
        case .created:
            info.text = infoNFT
        case .linkOpenSea:
            let attributedString = NSMutableAttributedString(string: "Conheça a NFT")
                    attributedString.addAttribute(.link, value: infoNFT, range: NSRange(location: 19, length: 55))

            infoTextView.attributedText = attributedString
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
        rectangle.addSubview(info)
    }
    
    private func setupConstraints() {
        stackTitle.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        rectangle.snp.makeConstraints { make in
            make.top.equalTo(stackTitle.snp.bottom).offset(5)
            make.trailing.leading.equalToSuperview()
        }
        info.snp.makeConstraints { make in
            make.top.equalTo(rectangle.snp.top).offset(4)
            make.leading.equalTo(rectangle.snp.leading).offset(12)
            make.trailing.equalTo(rectangle.snp.trailing).offset(-12)
            
        }
    }
}

enum TypeInfoNFT {
    case created
    case linkOpenSea
}
