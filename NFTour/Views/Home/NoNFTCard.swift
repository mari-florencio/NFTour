//
//  NoNFTCard.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 23/11/21.
//

import UIKit

class NoNFTCard: UIView {
    
    private lazy var icon : UIImageView = {
        let icon = UIImageView()
        let configuration = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 64, weight: .light))

        icon.image = UIImage(systemName: "theatermasks", withConfiguration: configuration)
        icon.contentMode = .scaleAspectFit
        icon.tintColor = UIColor(named: "textColor")
        
        return icon
    }()

    private lazy var phase: UILabel = {
        let description = UILabel()
        description.text = "You still don't have NFTs to use them in the app"
        description.textColor = UIColor(named: "textColor")
        description.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        description.lineBreakMode = .byTruncatingMiddle
        description.numberOfLines = 3
        return description
        
    }()
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        self.backgroundColor = UIColor(named: "grayWallet")
        self.layer.cornerRadius = 17
        self.clipsToBounds = true
    }
    
    private func setupHierarchy() {
        // Adiciona botões como subview
        //addSubview(background)
        self.addSubview(icon)
        self.addSubview(phase)
    }
    
    private func setupConstraints() {
        icon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(99)
            make.leading.equalToSuperview().offset(98)
            make.trailing.equalToSuperview().offset(97)
//            make.height.equalTo(20)
//            make.width.equalTo(130)
        }
        
        phase.snp.makeConstraints { make in
            make.top.equalTo(icon.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(69)
            make.trailing.equalToSuperview().offset(69)
            
        }
    }
}
