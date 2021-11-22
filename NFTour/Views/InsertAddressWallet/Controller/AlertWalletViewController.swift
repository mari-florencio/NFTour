//
//  ConfirmAlertWalletViewController.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 14/11/21.
//

import UIKit

class AlertWalletViewController: UIViewController {
    
    var model: Model = Model()
    
    var wallet: WalletConfirm
    let menuView = UIView()
    let menuHeight = UIScreen.main.bounds.height / 2.5
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
        
        iconImage.image = (wallet == .connected) ? UIImage(systemName: "checkmark.circle", withConfiguration: configuration) : UIImage(systemName: "exclamationmark.circle", withConfiguration: configuration)
        iconImage.tintColor = .white
        
        return iconImage
    }()
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.text = (wallet == .connected) ? "Connected wallet!" : "Try again!"
        title.textColor = .white
        title.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        title.textAlignment = .center
        return title
    }()
    
    private lazy var subtitle: UILabel = {
        let subtitle = UILabel()
        subtitle.text = (wallet == .connected) ? "Sua carteira foi encontrada! Estamos puxando suas NFTs para que você comece a colocar elas por aí" : "Não conseguimos conectar com sua carteira da OpenSea. Por favor, tente novamente"
        subtitle.textColor = .white
        subtitle.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        subtitle.textAlignment = .center
        subtitle.numberOfLines = 0
        
        return subtitle
    }()
    
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
        menuView.backgroundColor = (wallet == .connected) ? UIColor(named: "greenSucess") : UIColor(named: "orangeError")
        menuView.layer.cornerRadius = 15
        menuView.layer.masksToBounds = true
        
        buttonClose.addTarget(self, action: #selector(goToCollection(_sender:)), for: .touchUpInside)
    }
    
    private func setupHierarchy() {
        // Adiciona botões como subview
        //addSubview(background)
        view.addSubview(backdropView)
        
        
        menuView.addSubview(buttonClose)
        menuView.addSubview(iconImage)
        menuView.addSubview(titleLabel)
        menuView.addSubview(subtitle)
        
        view.addSubview(menuView)
        
    }
    
    @objc func goToCollection (_sender: UIButton!) {
        let newViewController = TabBarbViewController(profile: model.profile)

        let navigationController = UINavigationController(rootViewController: newViewController)
        navigationController.modalPresentationStyle = .custom
        present(navigationController, animated: true, completion: nil)
    
    }
    
    private func setupConstraints() {
        buttonClose.snp.makeConstraints { make in
            make.top.equalTo(menuView.snp.top).offset(20)
            make.leading.equalTo(333)
            make.trailing.equalTo(-24)
          
            
        }

        iconImage.snp.makeConstraints { make in
            make.top.equalTo(menuView.snp.top).offset(80)
            make.centerX.equalToSuperview()
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImage.snp.bottom).offset(22)
            make.centerX.equalToSuperview()
        }

        subtitle.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.leading.equalTo(40)
            make.trailing.equalTo(-40)
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

            return CGRect(x: 0, y: theView.bounds.height/2.5, width: theView.bounds.width, height: theView.bounds.height/2.5)
        }
    }
}
