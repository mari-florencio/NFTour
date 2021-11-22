//
//  AdressWalletViewController.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 12/11/21.
//

import UIKit

class AddressWalletViewController: UIViewController{

    private lazy var descriptionLabel: UILabel = {
        let description = UILabel()
        description.text = "Insira o endereço da sua carteira conectada à OpenSea"
        description.textColor = UIColor(named: "textColor")
        description.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        description.numberOfLines = 0
        description.textAlignment = .left
        
        return description
    }()
    
    private lazy var insertWalletTextField: AddressTextField = {
        .init(placeholder: "Endereço")
    }()
    
    private lazy var buttonConnect: PrincipalButton = PrincipalButton.createButton(placeholder: "Conectar")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.backgroundColor = UIColor(named: "backgroundColor")
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "textColor") as Any]
        
        self.title = "Connect Wallet"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        setupView()
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupView(){
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        buttonConnect.addTarget(self, action: #selector(tryConnect(_sender:)), for: .touchUpInside)
    }
    
    @objc func tryConnect (_sender: UIButton!) {
        let newViewController = AlertWalletViewController(wallet: .connected)
        let navigationController = UINavigationController(rootViewController: newViewController)
        navigationController.modalPresentationStyle = .custom
        present(navigationController, animated: true, completion: nil)
    }
    
    private func setupHierarchy() {
        // Adiciona botões como subview
        //addSubview(background)
        view.addSubview(descriptionLabel)
        view.addSubview(insertWalletTextField)
        view.addSubview(buttonConnect)
    }
    
    private func setupConstraints() {
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(21)
            make.leading.equalTo(21)
            make.trailing.equalTo(-84)
        }
        
        insertWalletTextField.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(24)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
        }
        
        buttonConnect.snp.makeConstraints { make in
            make.top.equalTo(insertWalletTextField.snp.bottom).offset(16)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
        }
        
    }
    
}
