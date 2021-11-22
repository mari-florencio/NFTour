//
//  MapScreenCollectionView.swift
//  NFTour
//
//  Created by Guilerme Barciki on 19/11/21.
//

import Foundation
import UIKit

class MapScreenCollectionView: UIViewController {
    
    private var profile: ProfileUser
    private var collectionView : HorizontalCollection = .init()
    private var collectionData = [HorizontalCollection.CollectionData]()
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "NFTs exibidas"
        label.textColor = UIColor(named: "textColor")
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight:  .bold)
        return label
    }()
    
    init(profile: ProfileUser){
        self.profile = profile
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.cornerRadius = 30
        view.backgroundColor = .red
        setupView()
        setupHierarchy()
        setupConstraints()
        
        collectionView.configureView(with: collectionData)
        collectionView.takeViewController(view: self)
    }
    
    private func setupView(){
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        //colllection
        for nft in profile.nfts {
            collectionData.append(.init(nft: nft))
        }
    }
    
    private func setupHierarchy() {
        view.addSubview(collectionView)
        view.addSubview(titleLabel)
    }
    private func setupConstraints() {
        
        
        collectionView.snp.makeConstraints { make in
            make.height.equalTo(415)
            make.top.equalTo(titleLabel.snp.bottom).offset(22)
            make.leading.equalToSuperview().offset(26)
            make.trailing.equalToSuperview().offset(-27)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(22)
            make.leading.equalToSuperview().offset(27)
            make.trailing.equalToSuperview().offset(-27)
        }
        
    }
}



