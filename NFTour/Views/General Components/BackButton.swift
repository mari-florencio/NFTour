//
//  BackButton.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 23/11/21.
//

import UIKit

class BackButton: UIButton {
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
    }

    // Compilador briga com a gente se não implementarmos isso
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func makeBackButton(placeholder: String, textColor: UIColor) -> BackButton {
        let button = BackButton()
        let configuration = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 20, weight: .bold))
        
        button.setImage(UIImage(systemName: "chevron.left", withConfiguration: configuration), for: .normal)
        button.tintColor = textColor
        button.setTitle("  \(placeholder)", for: .normal)
        button.setTitleColor(textColor, for: .normal)
        button.setTitleColor(textColor, for: .selected)
    
        return button
    }

}
