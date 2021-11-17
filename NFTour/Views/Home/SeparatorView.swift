//
//  SeparatorView.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 15/11/21.
//

import UIKit

class SeparatorView: UIView {
    
    // REVIEW: Is this really necessary? viewHeight also
    override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: 1)
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = UIColor(named: "red")
        layer.cornerRadius = 1
        layer.masksToBounds = false
        clipsToBounds = true
    }
}

