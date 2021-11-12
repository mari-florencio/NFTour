//
//  AdressWalletViewController.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 12/11/21.
//

import UIKit

class AddressWalletViewController: UIViewController {

    private lazy var descriptionLabel: UILabel = {
        let description = UILabel()
        description.text = "Insira o endereço da sua carteira conectada à OpenSea"
        description.textColor = UIColor(named: "textColor")
        description.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        description.numberOfLines = 0
        description.textAlignment = .left
        
        return description
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.backgroundColor = UIColor(named: "backgroundColor")
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "textColor")]
        
        self.title = "Connect Wallet"
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
        view.addSubview(descriptionLabel)
    }
    
    private func setupConstraints() {
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(399)
            make.leading.equalTo(25)
            make.trailing.equalTo(-84)
        }
        
    }
}
