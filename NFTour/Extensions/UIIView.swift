//
//  UIImageView.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 15/11/21.
//

import Foundation
import UIKit

extension UIView {

    func makeRounded() {
        layer.borderWidth = 1
        layer.cornerRadius = frame.height / 2
        layer.masksToBounds = false
        layer.borderColor = UIColor.clear.cgColor
        clipsToBounds = true
    }
}
