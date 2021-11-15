//
//  InsertAddressView.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 12/11/21.
//

import UIKit
import SnapKit

class AddressTextFieldView: UITextField, UITextFieldDelegate {

    
    convenience init(placeholder: String) {
        self.init(frame: .zero)
        self.placeholder = placeholder
    }

    private override init(frame: CGRect) {
        super.init(frame: frame)

        placeholder = placeholder
        textColor = UIColor(named: "textColor")
        font = UIFont.systemFont(ofSize: 16, weight: .regular)
        borderStyle = UITextField.BorderStyle.roundedRect
        layer.borderWidth = 2
        layer.borderColor = UIColor(named: "borderTextField")?.cgColor
        keyboardType = UIKeyboardType.default
        returnKeyType = UIReturnKeyType.done
        clearButtonMode = UITextField.ViewMode.whileEditing;
        backgroundColor = UIColor(named: "backgroundColor")
        layer.cornerRadius = 13
        
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 17.5, height: 20))
        leftView = paddingView
        leftViewMode = .always
        
        delegate = self
        
        self.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.width.equalTo(351)
            
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
        return true
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
