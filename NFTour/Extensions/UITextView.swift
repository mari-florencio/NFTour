//
//  UITextView.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 17/11/21.
//

import Foundation
import UIKit

extension UITextView {
    func hyperLink(originalText: String, hyperLink: String, urlString: String) {
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        let attributedOriginalText = NSMutableAttributedString(string: originalText)
        let linkRange = attributedOriginalText.mutableString.range(of: hyperLink)
        let fullRange = NSMakeRange(0, attributedOriginalText.length)
        attributedOriginalText.addAttribute(NSAttributedString.Key.link, value: urlString, range: linkRange)
        attributedOriginalText.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: fullRange)
        attributedOriginalText.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 12, weight: .regular), range: fullRange)
        self.linkTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
        ]
        self.attributedText = attributedOriginalText
    }
}
