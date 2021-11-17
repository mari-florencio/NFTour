//
//  LocalizationNFTView.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 17/11/21.
//

import UIKit

class LocalizationNFTView: UIView {

    private let localizationLabel = UILabel()
    
    
    private lazy var stackLocalization: UIStackView = {
        let configuration = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 14, weight: .regular))
        
        let icon = UIImageView()
        icon.image = UIImage(systemName: "mappin.and.ellipse", withConfiguration: configuration)
        icon.tintColor = UIColor(named:"textColor")
        icon.contentMode = .scaleAspectFit
        
        icon.snp.makeConstraints { make in
            make.height.equalTo(17)
            make.width.equalTo(16)
        }
        
        localizationLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        localizationLabel.textColor = UIColor(named: "textColor")
        localizationLabel.numberOfLines = 2
        localizationLabel.lineBreakMode = .byWordWrapping
        
        let stack = UIStackView(arrangedSubviews: [icon, localizationLabel])
        stack.axis = .horizontal
        stack.spacing = 15
        
        
        let buttonRemove = RemoveButton.init()
        
        let secondStack = UIStackView(arrangedSubviews: [stack, buttonRemove])
        secondStack.axis = .horizontal
        secondStack.spacing = 50
        
        return secondStack
        
        
    }()
    
    convenience init(localization: String) {
        self.init(frame: .zero)
        localizationLabel.text = localization
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
        self.addSubview(stackLocalization)
    }
    
    private func setupConstraints() {
        stackLocalization.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }

    }
}
