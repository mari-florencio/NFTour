//
//  ButtonView.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 11/11/21.
//

import UIKit
import SnapKit

class ButtonView: UIButton {

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
    }

    // Compilador briga com a gente se não implementarmos isso
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(placeholder: String){
        super.init(frame: .zero)
        self.setTitle(placeholder, for: .normal)
        self.setTitleColor(UIColor(named: "textColorButton"), for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        self.backgroundColor = UIColor(named: "backgroundButton")
        self.layer.cornerRadius = 13
        self.clipsToBounds = true
       
        self.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.width.equalTo(351)
            
        }
    }
}
