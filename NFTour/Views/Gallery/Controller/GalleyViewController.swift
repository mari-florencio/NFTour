//
//  GalleyViewController.swift
//  NFTour
//
//  Created by Maria Luiza Amaral on 17/11/21.
//

import UIKit

class GalleyViewController: UIViewController {
    
    private var profile: ProfileUser
    
    private var collectionView: HomeCollection = .init(typeView: .gallery)
    private var collectionData = [HomeCollection.CollectionData]()
    
    private let segmentedFilter: FilterSegmentedControl = .createSegmented()
    
    private lazy var backButton: BackButton = BackButton.makeBackButton(placeholder: "Home", textColor: UIColor(named: "textColor")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupNavigation()
        setupView()
        setupHierarchy()
        setupConstraints()
        
        collectionView.configureView(with: collectionData)
        collectionView.takeViewController(view: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    init(profile: ProfileUser){
        self.profile = profile
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupNavigation(){
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftItemsSupplementBackButton = true
        
        self.navigationController!.navigationBar.backgroundColor = UIColor(named: "backgroundColor")
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "textColor") as Any]
        self.title = "My collection"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        
    }
    
    private func setupView(){
        view.backgroundColor = UIColor(named: "backgroundColor")
    
        //sobre a collection de nft
        for nft in profile.nfts {
            collectionData.append(.init(nft: nft))
        }
        
        //target Segmented control
        segmentedFilter.addTarget(self, action: #selector(pressed(_:)), for: .valueChanged)
 
    }
    
    @objc func pressed(_ sender: UISegmentedControl) {
        collectionData.removeAll()
        if sender.selectedSegmentIndex == 1 {
            for nft in profile.nfts {
                if nft.isPositioned{
                    collectionData.append(.init(nft: nft))
                }
            }
        }else if sender.selectedSegmentIndex == 0 {
            for nft in profile.nfts {
                collectionData.append(.init(nft: nft))
            }
        }
        
        collectionView.configureView(with: collectionData)
        collectionView.takeViewController(view: self)
        viewDidAppear(true)
    }
    
    @objc func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func loadData() {
        // code to load data from network, and refresh the interface
        collectionView.loadData()
    }
    
    private func setupHierarchy() {
        // Adiciona botões como subview
        //addSubview(background)
        view.addSubview(segmentedFilter)
        view.addSubview(collectionView)
        
    }
    
    private func setupConstraints() {
        segmentedFilter.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.top.equalToSuperview().offset(15)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            
        }
        
        collectionView.snp.makeConstraints { make in
            make.height.equalTo(600)
            make.top.equalTo(segmentedFilter.snp.bottom).offset(27)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    
    }
}
