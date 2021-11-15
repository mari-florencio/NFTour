//
//  ViewController.swift
//  NFTour
//
//  Created by Mariana Florencio on 10/11/21.
//

import UIKit
import SnapKit

class OnbordingHomeViewController: UIViewController {
    
    private lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named: "backgroundImage")
        
        return backgroundImage
    }()
    
    private lazy var logo: UIImageView = {
        let logoViewImage = UIImageView()
        logoViewImage.image = UIImage(named: "logo")
        logoViewImage.contentMode = .scaleAspectFit
        
        return logoViewImage
    }()
    
    private lazy var titleHome: UILabel = {
        let title = UILabel()
        title.text = "Mostre suas NFTs para o mundo!"
        title.textColor = UIColor(named: "textColor")
        title.font = UIFont.systemFont(ofSize: 27, weight: .bold)
        title.numberOfLines = 0
        title.textAlignment = .center
        
        return title
    }()
    
    private lazy var subtitle: UILabel = {
        let subtitle = UILabel()
        subtitle.text = "Insira o endereço da sua carteira da OpenSea para fazer parte dessa realidade"
        subtitle.textColor = UIColor(named: "textColor")
        subtitle.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        subtitle.numberOfLines = 0
        subtitle.textAlignment = .center
        
        return subtitle
    }()
    
    private lazy var buttonStart: ButtonView = ButtonView.createButton(placeholder: "Começar")

    @objc func pressed(_sender: UIButton!) {
        let newViewController = AddressWalletViewController()
        let navigationController = UINavigationController(rootViewController: newViewController)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setupHierarchy() {
        // Adiciona botões como subview
        //addSubview(background)
        view.addSubview(logo)
        view.addSubview(backgroundImage)
        view.addSubview(titleHome)
        view.addSubview(subtitle)
        view.addSubview(buttonStart)
    }
    
    private func setupView(){
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        buttonStart.addTarget(self, action: #selector(pressed(_sender:)), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        logo.snp.makeConstraints { make in
            make.height.equalTo(146)
            make.width.equalTo(28)
            make.top.equalToSuperview().offset(60)
            make.leading.equalTo(114)
            make.trailing.equalTo(-114)
        }
        
        backgroundImage.snp.makeConstraints { make in
            make.height.equalTo(233)
            make.width.equalTo(286)
            make.top.equalTo(logo.snp.bottom).offset(60)
            make.leading.equalTo(47)
            make.trailing.equalTo(-42)
        }
        
        titleHome.snp.makeConstraints { make in
            make.top.equalTo(backgroundImage.snp.bottom).offset(61)
            make.leading.equalToSuperview().offset(68)
            make.trailing.equalToSuperview().offset(-68)
        }
        
        subtitle.snp.makeConstraints { make in
            make.top.equalTo(titleHome.snp.bottom).offset(19)
            make.leading.equalToSuperview().offset(38)
            make.trailing.equalToSuperview().offset(-38)
        }
        
        buttonStart.snp.makeConstraints { make in
            make.top.equalTo(subtitle.snp.bottom).offset(48)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            
        }
    }

}

