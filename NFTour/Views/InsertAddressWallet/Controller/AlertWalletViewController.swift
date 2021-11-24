//
//  ConfirmAlertWalletViewController.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 14/11/21.
//

import UIKit

class AlertWalletViewController: UIViewController {
    
    var model: Model = Model()
    private var profile = Model().profile
    var wallet: WalletConfirm
    let menuView = UIView()
    let menuHeight = UIScreen.main.bounds.height / 2.4
    var isPresenting = false
    
    lazy var backdropView: UIView = {
        let bdView = UIView(frame: self.view.bounds)
        bdView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return bdView
    }()
    
    private lazy var buttonClose: IconButton = IconButton.createButtonX()
    
    private lazy var iconImage: UIImageView = {
        let iconImage = UIImageView()
        let configuration = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 48, weight: .medium))
        
        switch wallet {
        case .connected:
            iconImage.image =  UIImage(systemName: "checkmark.circle", withConfiguration: configuration)
        case .notConnected:
            iconImage.image =  UIImage(systemName: "exclamationmark.circle", withConfiguration: configuration)
        case .loading:
            iconImage.image =  UIImage(systemName: "clock.arrow.circlepath", withConfiguration: configuration)
        }
        iconImage.tintColor = .white
        
        return iconImage
    }()
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        switch wallet {
        case .connected:
            title.text = "Connected wallet!"
        case .notConnected:
            title.text = "Try again!"
        case .loading:
            title.text = "Loading"
        }
        
        title.textColor = .white
        title.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        title.textAlignment = .center
        return title
    }()
    
    private lazy var subtitle: UILabel = {
        let subtitle = UILabel()
        
        switch wallet {
        case .connected:
            subtitle.text = "Your wallet has been found! We are getting your NTFs so you can position them around the world"
        case .notConnected:
            subtitle.text = "We are unable to connect with your OpenSea wallet. Please try again"
        case .loading:
            subtitle.text = ""
        }
        subtitle.textColor = .white
        subtitle.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        subtitle.textAlignment = .center
        subtitle.numberOfLines = 0
        
        return subtitle
    }()
    
    private lazy var buttonGo: PrincipalButton = .createButton(placeholder: "Go to NFTour")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupConstraints()
        
    }
    
    init(wallet: WalletConfirm) {
        self.wallet = wallet
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        switch wallet {
        case .connected:
            menuView.backgroundColor = UIColor(named: "greenSucess")
        case .notConnected:
            menuView.backgroundColor = UIColor(named: "orangeError")
        case .loading:
            menuView.backgroundColor = UIColor(named: "purple")
        }
        
        menuView.layer.cornerRadius = 15
        menuView.layer.masksToBounds = true
        
        if wallet == .notConnected  {
            buttonClose.addTarget(self, action: #selector(dismiss(_sender:)), for: .touchUpInside)
        }
        
        if wallet == .connected  {
            buttonGo.addTarget(self, action: #selector(goToCollection(_sender:)), for: .touchUpInside)
        }
        
    }
    
    private func setupHierarchy() {
        // Adiciona botões como subview
        //addSubview(background)
        view.addSubview(backdropView)
        
        if wallet == .notConnected  {
            menuView.addSubview(buttonClose)
        }
        menuView.addSubview(iconImage)
        menuView.addSubview(titleLabel)
        menuView.addSubview(subtitle)
        
        if wallet == .connected  {
            menuView.addSubview(buttonGo)
        }
        
        view.addSubview(menuView)
        
    }
    
    @objc func goToCollection (_sender: UIButton!) {
        let newViewController = HomeGalleryViewController(profile: profile )

        let navigationController = UINavigationController(rootViewController: newViewController)
        navigationController.modalPresentationStyle = .custom
        present(navigationController, animated: true, completion: nil)
    
    }
    
    @objc func dismiss (_sender: UIButton!) {
        self.dismiss(animated: true, completion: nil)
    
    }
    
    private func setupConstraints() {
        if wallet == .notConnected  {
            buttonClose.snp.makeConstraints { make in
                make.top.equalTo(menuView.snp.top).offset(20)
                make.leading.equalTo(333)
                make.trailing.equalTo(-24)
            }
        }

        iconImage.snp.makeConstraints { make in
            if wallet == .connected {
                make.top.equalTo(menuView.snp.top).offset(35)
            }else{
                make.top.equalTo(menuView.snp.top).offset(80)
                
            }
            make.centerX.equalToSuperview()
        }

        titleLabel.snp.makeConstraints { make in
            if wallet == .connected {
                make.top.equalTo(iconImage.snp.bottom).offset(16)
            }else{
                make.top.equalTo(iconImage.snp.bottom).offset(22)
                
            }
            make.centerX.equalToSuperview()
            
        }

        subtitle.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.leading.equalTo(40)
            make.trailing.equalTo(-40)
        }
        
        if wallet == .connected  {
            buttonGo.snp.makeConstraints { make in
                make.top.equalTo(subtitle.snp.bottom).offset(24)
                make.centerX.equalToSuperview()
                make.leading.equalTo(20)
                make.trailing.equalTo(-20)
            }
        }
        
        //TODO : mudar para o formato de snapkit
        menuView.translatesAutoresizingMaskIntoConstraints = false
            menuView.heightAnchor.constraint(equalToConstant: menuHeight).isActive = true
            menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            menuView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            menuView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }
    
    enum WalletConfirm {
        case connected
        case notConnected
        case loading
    }
}

extension AlertWalletViewController: UIViewControllerAnimatedTransitioning {
    
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        guard let toVC = toViewController else { return }
        isPresenting = !isPresenting
        
        if isPresenting == true {
            containerView.addSubview(toVC.view)
            
            menuView.frame.origin.y += menuHeight
            backdropView.alpha = 0
            
            UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
                self.menuView.frame.origin.y -= self.menuHeight
                self.backdropView.alpha = 1
            }, completion: { (finished) in
                transitionContext.completeTransition(true)
            })
        } else {
            UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
                self.menuView.frame.origin.y += self.menuHeight
                self.backdropView.alpha = 0
            }, completion: { (finished) in
                transitionContext.completeTransition(true)
            })
        }
    }
}

extension AlertWalletViewController: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return HalfSizePresentationController(presentedViewController: presented, presenting: presenting)
    }
    
}

class HalfSizePresentationController : UIPresentationController {
    override var frameOfPresentedViewInContainerView: CGRect {
        get {
            guard let theView = containerView else {
                return CGRect.zero
            }

            return CGRect(x: 0, y: theView.bounds.height/1.8, width: theView.bounds.width, height: theView.bounds.height/1.8)
        }
    }
}
