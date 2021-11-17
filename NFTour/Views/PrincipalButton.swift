//
//  ButtonView.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 11/11/21.
//

import UIKit
import SnapKit

class PrincipalButton: UIButton {

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
    }

    // Compilador briga com a gente se não implementarmos isso
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func createButton(placeholder: String) -> PrincipalButton {
        let button = PrincipalButton()

        button.setTitle(placeholder, for: .normal)
        button.setTitleColor(UIColor(named: "textColorButton"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = UIColor(named: "backgroundButton")
        button.layer.cornerRadius = 13
        button.clipsToBounds = true

        
        button.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.width.equalTo(351)
            
        }
        
        return button
    }
}
