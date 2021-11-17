//
//  AddressWalletRectangle.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 15/11/21.
//

import UIKit

class AddressWalletRectangle: UIView {
    
    private lazy var rectangle: UIView = {
        let rectangle = UIView()
        rectangle.backgroundColor = UIColor(named: "grayWallet")
        rectangle.layer.cornerRadius = 10
        rectangle.layer.masksToBounds = false
        rectangle.clipsToBounds = true
        
        return rectangle
        
    }()
    
    private lazy var addressWalletLabel: UILabel = {
        let address = UILabel()
        address.textColor = UIColor(named: "textColor")
        address.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        address.lineBreakMode = .byTruncatingMiddle
        return address
        
    }()
    
    convenience init(address: String) {
        self.init(frame: .zero)
        addressWalletLabel.text = address
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        // Adiciona botões como subview
        //addSubview(background)
        self.addSubview(rectangle)
        rectangle.addSubview(addressWalletLabel)
    }
    
    private func setupConstraints() {
        rectangle.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(130)
        }
        
        addressWalletLabel.snp.makeConstraints { make in
            make.top.equalTo(rectangle.snp.top)
            make.leading.equalTo(rectangle.snp.leading).offset(14)
            make.trailing.equalTo(rectangle.snp.trailing).offset(-14)
            make.height.equalTo(20)
            make.width.equalTo(130)
        }
        
    }
}



