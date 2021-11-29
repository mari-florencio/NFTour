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
        description.text = "Enter the address of your OpenSea wallet"
        description.textColor = UIColor(named: "textColor")
        description.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        description.numberOfLines = 0
        description.textAlignment = .left
        
        return description
    }()
    
    private lazy var insertWalletTextField: AddressTextField = {
        .init(placeholder: "Address")
    }()
    
    private lazy var buttonConnect: PrincipalButton =  .createButtonDisable(placeholder: "Connect")
    
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
        buttonConnect.isEnabled = false
        buttonConnect.addTarget(self, action: #selector(tryConnect(_sender:)), for: .touchUpInside)
        
        insertWalletTextField.addTarget(self, action: #selector(textFieldEditingDidChange(_:)), for: UIControl.Event.editingChanged)
    }
    
    @objc func tryConnect (_sender: UIButton!) {
        
        LocalDataService().createUser()
        LocalDataService().editUserWallet(wallet: insertWalletTextField.text!)
        var newViewController = AlertWalletViewController(wallet: .loading)
        var navigationController = UINavigationController(rootViewController: newViewController)
        navigationController.modalPresentationStyle = .custom
        present(navigationController, animated: true, completion: nil)
        
        DefaultOpenSeaRepository.shared.fetchNFTs(ownerId: insertWalletTextField.text!) { nfts in
            if let nfts = nfts {
                navigationController.dismiss(animated: true) {
                    newViewController = AlertWalletViewController(wallet: .connected)
                    navigationController = UINavigationController(rootViewController: newViewController)
                    navigationController.modalPresentationStyle = .custom
                    self.present(navigationController, animated: true, completion: nil)
                }
            } else {
                navigationController.dismiss(animated: true) {
                    newViewController = AlertWalletViewController(wallet: .notConnected)
                    navigationController = UINavigationController(rootViewController: newViewController)
                    navigationController.modalPresentationStyle = .custom
                    self.present(navigationController, animated: true, completion: nil)
                }
            }
            print(nfts)
        }
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
            make.leading.equalTo(20)
            make.trailing.equalTo(-84)
        }
        
        insertWalletTextField.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(24)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
        
        buttonConnect.snp.makeConstraints { make in
            make.top.equalTo(insertWalletTextField.snp.bottom).offset(16)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
        
    }
    
}

extension AddressWalletViewController: UITextFieldDelegate {
    
    @objc func textFieldEditingDidChange(_ sender: UITextField){
        buttonConnect.isEnabled = true
        buttonConnect.setTitleColor(UIColor(named: "textColorButton"), for: .normal)
        buttonConnect.backgroundColor = UIColor(named: "backgroundButton")
        
    }
}
