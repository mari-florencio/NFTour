//
//  LocalData.swift
//  NFTour
//
//  Created by Alessandra Fernandes Lacerda on 19/11/21.
//

import Foundation
import RealmSwift

class UserData: Object {
    @objc dynamic var wallet: String = ""
}

class SavedNFT: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var latitude: Double = 0
    @objc dynamic var longitude: Double = 0
}
