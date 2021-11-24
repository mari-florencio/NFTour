//
//  ConfirmationModalViewController.swift
//  NFTour
//
//  Created by Alessandra Fernandes Lacerda on 24/11/21.
//

import UIKit
import ARKit

class ConfirmationModalViewController: UIViewController {
    
    var mainViewController: ARViewController?
    let menuView = UIView()
    let menuHeight = UIScreen.main.bounds.height / 4
    var isPresenting = false
    
    private lazy var confirmationLabel: UILabel = {
        let label = UILabel()
        label.text = "Do you want to place your NFT here?"
        label.textColor = UIColor(named: "textColor")
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        label.textAlignment = .left
        label.clipsToBounds = true
        
        return label
    }()

    private var closeButton: UIButton = {
        let button = UIButton()
        let configuration = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 20, weight: .medium))

        button.setImage(UIImage(systemName: "xmark", withConfiguration: configuration), for: .normal)
        button.tintColor = UIColor.white

        return button
    }()
    
    private var confirmButton: UIButton = {
        let button = UIButton()
        let configuration = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 20, weight: .medium))

        button.setTitle("Place NFT", for: .normal)
        button.setTitleColor(UIColor(named: "textColorButton"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = UIColor(named: "backgroundButton")!
        button.layer.cornerRadius = 13
        button.clipsToBounds = true

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modalPresentationStyle = .custom
        transitioningDelegate = self
        menuView.layer.cornerRadius = 15
        menuView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        menuView.backgroundColor = .black
        
        closeButton.addTarget(self, action: #selector(pressed(_sender:)), for: .touchUpInside)
        confirmButton.addTarget(self, action: #selector(pressed(_sender:)), for: .touchUpInside)
        
        addSubviews()
        setupConstraints()
        
    }
    
    @objc func pressed(_sender: UIButton!) {
        if _sender == closeButton {
            mainViewController?.clearARView()
        }else {
            mainViewController?.saveLocation()
        }
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    func addSubviews() {
        menuView.addSubview(closeButton)
        menuView.addSubview(confirmationLabel)
        menuView.addSubview(confirmButton)
        view.addSubview(menuView)
        
    }
    
    func setupConstraints() {
        closeButton.snp.makeConstraints { make in
            make.height.equalTo(18)
            make.width.equalTo(32)
            make.top.equalTo(menuView.snp.top).offset(21)
            make.trailing.equalTo(-18)
        }
        
        confirmationLabel.snp.makeConstraints { make in
            make.top.equalTo(menuView.snp.top).offset(21)
            make.trailing.equalTo(closeButton.snp.leading).offset(-18)
            make.leading.equalTo(18)
        }
        
        confirmButton.snp.makeConstraints { make in
            make.top.equalTo(confirmationLabel.snp.bottom).offset(18)
            make.height.equalTo(52)
            make.leading.equalTo(menuView.snp.leading).offset(20)
            make.trailing.equalTo(menuView.snp.trailing).offset(-20)
        }
        
        menuView.translatesAutoresizingMaskIntoConstraints = false
        menuView.heightAnchor.constraint(equalToConstant: menuHeight).isActive = true
        menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        menuView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }
}

extension ConfirmationModalViewController: UIViewControllerAnimatedTransitioning {
    
    
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

            UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
                self.menuView.frame.origin.y -= self.menuHeight
            }, completion: { (finished) in
                transitionContext.completeTransition(true)
            })
        } else {
            UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
                self.menuView.frame.origin.y += self.menuHeight
            }, completion: { (finished) in
                transitionContext.completeTransition(true)
            })
        }
    }
}

extension ConfirmationModalViewController: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return QuarterSizePresentationController(presentedViewController: presented, presenting: presenting)
    }
    
}

class QuarterSizePresentationController : UIPresentationController {
    override var frameOfPresentedViewInContainerView: CGRect {
        get {
            guard let theView = containerView else {
                return CGRect.zero
            }

            return CGRect(x: 0, y: theView.bounds.height/2.5, width: theView.bounds.width, height: theView.bounds.height/2.5)
        }
    }
}
