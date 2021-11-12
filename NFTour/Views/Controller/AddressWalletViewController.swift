//
//  AdressWalletViewController.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 12/11/21.
//

import UIKit

class AddressWalletViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.backgroundColor = UIColor(named: "backgroundColor")
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "textColor")]
        
        self.title = "Connect Wallet"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        setupView()
    }
    
    private func setupView(){
        view.backgroundColor = UIColor(named: "backgroundColor")
    }
}
