//
//  GalleyViewController.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 17/11/21.
//

import UIKit

class GalleyViewController: UIViewController {

    private let segmentedFilter: FilterSegmentedControl = .createSegmented()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.backgroundColor = UIColor(named: "backgroundColor")
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "textColor")]
        
        self.title = "Minha coleção"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        setupView()
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupView(){
        view.backgroundColor = UIColor(named: "backgroundColor")
    
    }
    private func setupHierarchy() {
        // Adiciona botões como subview
        //addSubview(background)
        view.addSubview(segmentedFilter)
        
    }
    
    private func setupConstraints() {
        segmentedFilter.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.top.equalToSuperview().offset(15)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            
        }
    
    }
}
