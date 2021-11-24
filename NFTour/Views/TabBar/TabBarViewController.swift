//
//  TabBarbViewController.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 20/11/21.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    // MARK: - Initialization
    
    private var profile: ProfileUser
    private var menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 73, height: 73))
    
    init(profile: ProfileUser) {
        self.profile = profile
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // start() //desliguei a tabbar
        //setupMiddleButton()
        
    }
    
    // MARK: - Public methods
    
    func start() {
        let pages: [TabBarPage] = [.home, .camera, .map]
            .sorted(by: { $0.pageIndex() < $1.pageIndex() })
        
        let controllers: [UINavigationController] = pages.map { getTabController($0) }
        
        prepareTabBarController(withTabControllers: controllers)
    }
    
    func selectPage(_ page: TabBarPage) {
        selectedIndex = page.pageIndex()
    }
    
    // MARK: - Private methods
    
    private func prepareTabBarController(withTabControllers tabControllers: [UIViewController]) {
        setViewControllers(tabControllers, animated: true)
        
        modalPresentationStyle = .fullScreen
        selectedIndex = TabBarPage.home.pageIndex()
        
        tabBar.backgroundColor = UIColor(named: "darkGray")
        tabBar.barTintColor = UIColor(named: "darkGray")
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor.white
        //tabBar.unselectedItemTintColor = .systemGray2
        
        //navigationController.viewControllers = self
    }
    
    private func getTabController(_ page: TabBarPage) -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(true, animated: false)
        
        let tabBarItem = UITabBarItem()
        tabBarItem.image = UIImage(systemName: page.pageIconName())
        tabBarItem.selectedImage = UIImage(systemName: "\(page.pageIconName()).fill")
        tabBarItem.tag = page.pageIndex()
        
        navController.tabBarItem = tabBarItem
        
        switch page {
        case .home:
            let homeVC = HomeGalleryViewController(profile: profile)
            navController.pushViewController(homeVC, animated: true)
        case .camera:
            let cameraVC = HomeGalleryViewController(profile: profile)
            navController.pushViewController(cameraVC, animated: true)
        case .map:
            let mapVC = MapViewController()
            
            navController.pushViewController(mapVC, animated: true)
        }
        
        return navController
    }
    
    func setupMiddleButton() {
        
        var menuButtonFrame = menuButton.frame
        menuButtonFrame.origin.y = view.bounds.height - menuButtonFrame.height - 45
        menuButtonFrame.origin.x = view.bounds.width/2 - menuButtonFrame.size.width/2
        menuButton.frame = menuButtonFrame
        
        menuButton.backgroundColor = UIColor(named: "red")
        menuButton.layer.cornerRadius = menuButtonFrame.height/2
        view.addSubview(menuButton)
        let configuration = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 24, weight: .medium))
        
        menuButton.setImage(UIImage(systemName: "camera", withConfiguration: configuration), for: .normal)
        menuButton.tintColor = .white
        menuButton.addTarget(self, action: #selector(menuButtonAction(sender:)), for: .touchUpInside)
        
        view.layoutIfNeeded()
    }
    
    
    // MARK: - Actions
    
    @objc private func menuButtonAction(sender: UIButton) {
        selectedIndex = 2
    }
    
}

enum TabBarPage: Int {
    case home
    case camera
    case map
    
    func pageIndex() -> Int {
        rawValue
    }
    
    func pageIconName() -> String {
        switch self {
        case .home:
            return "house"
        case .camera:
            return "camera"
        case .map:
            return "map"
        }
    }
}
