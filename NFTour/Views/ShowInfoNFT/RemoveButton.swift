//
//  RemoveButton.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 17/11/21.
//

import UIKit

class RemoveButton: UIButton {

    private override init(frame: CGRect) {
        super.init(frame: frame)

        let configuration = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 16, weight: .regular))
        
        setImage(UIImage(systemName: "trash", withConfiguration: configuration), for: .normal)
        tintColor = .white
        backgroundColor = UIColor(named: "darkGray")
        layer.cornerRadius = 8
        
        
        self.snp.makeConstraints { make in
            make.height.equalTo(41)
            make.width.equalTo(41)
            
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
