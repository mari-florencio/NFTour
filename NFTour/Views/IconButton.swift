//
//  CloseButton.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 14/11/21.
//

import UIKit

class IconButton: UIButton {

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
    }

    // Compilador briga com a gente se não implementarmos isso
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func createButtonX() -> IconButton {
        let button = IconButton()
        let configuration = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 20, weight: .medium))
        
        button.setImage(UIImage(systemName: "xmark", withConfiguration: configuration), for: .normal)
        button.tintColor = UIColor(named: "textColorButton")

        button.snp.makeConstraints { make in
            make.height.equalTo(18)
            make.width.equalTo(32)
            
        }
        
        return button
    }
    
    static func createButtonShowMore() -> IconButton {
        let button = IconButton()
        let configuration = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 20, weight: .bold))
        
        button.setImage(UIImage(systemName: "chevron.forward", withConfiguration: configuration), for: .normal)
        button.tintColor = UIColor(named: "textColor")

        button.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.width.equalTo(15)
            
        }
        
        return button
    }

}
