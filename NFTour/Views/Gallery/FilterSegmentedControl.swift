//
//  FilterButton.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 17/11/21.
//

import UIKit

class FilterSegmentedControl: UISegmentedControl {
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
       
    }

    // Compilador briga com a gente se não implementarmos isso
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   static func createSegmented() -> FilterSegmentedControl {
        let control = FilterSegmentedControl()
        control.insertSegment(withTitle: "todas", at: 0, animated: true)
        control.insertSegment(withTitle: "exibidas", at: 1, animated: true)
        control.selectedSegmentIndex = 0
        control.layer.cornerRadius = 20
        control.layer.masksToBounds = true
        control.tintColor = .white
        //control.fon = UIFont.systemFont(ofSize: 14, weight: .bold)
        control.backgroundColor = UIColor(named: "backgroundColor")
        //control.layer.borderColor = UIColor(named: "red")?.cgColor
        //control.layer.borderWidth = 1
        control.selectedSegmentTintColor = UIColor(named: "red")
    
        let fontAttributes: NSDictionary = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .bold)
       ]

       control.setTitleTextAttributes(fontAttributes as? [NSAttributedString.Key : Any], for: .selected)
        
        return control
    }

}
