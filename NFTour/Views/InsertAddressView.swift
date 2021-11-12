//
//  InsertAddressView.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 12/11/21.
//

import UIKit

class InsertAddressView: UITextField {


    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
    }

    // Compilador briga com a gente se não implementarmos isso
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(placeholder: String){
        super.init(frame: .zero)
        
    }
}
