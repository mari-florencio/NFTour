//
//  PriceNFTView.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 16/11/21.
//

import UIKit

class PriceNFTView: UIView {

    private lazy var rectangle: UIView = {
        let rectangle = UIView()
        rectangle.backgroundColor = UIColor.clear
        rectangle.layer.borderColor = UIColor(named: "red")?.cgColor
        rectangle.layer.borderWidth = 1
        rectangle.layer.cornerRadius = 15
        rectangle.layer.masksToBounds = false
        rectangle.clipsToBounds = true
        
        return rectangle
        
    }()
    
    private let priceLabel = UILabel()
    
    private lazy var stackPrice: UIStackView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "etherium")
        icon.contentMode = .scaleAspectFit
        
        icon.snp.makeConstraints { make in
            make.height.equalTo(19)
            make.width.equalTo(13)
        }
        
        priceLabel.textColor = UIColor(named: "textColor")
        priceLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        
        let stack = UIStackView(arrangedSubviews: [icon,priceLabel])
        stack.axis = .horizontal
        stack.spacing = 8
        
        return stack
        
    }()
    
    convenience init(price: Double) {
        self.init(frame: .zero)
        priceLabel.text = "\(price)"
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
        self.addSubview(rectangle)
        rectangle.addSubview(stackPrice)
    }
    
    private func setupConstraints() {
        rectangle.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(33)
            make.width.equalTo(86)
        }
        
        stackPrice.snp.makeConstraints { make in
            make.top.equalTo(rectangle.snp.top).offset(7)
            make.leading.equalTo(rectangle.snp.leading).offset(16)
            make.trailing.equalTo(rectangle.snp.trailing).offset(-12)
        }
        
    }
}
