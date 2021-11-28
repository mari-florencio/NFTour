//
//  LocalDataService.swift
//  NFTour
//
//  Created by Alessandra Fernandes Lacerda on 19/11/21.
//

import Foundation
import RealmSwift

class LocalDataService {

    static let realm = try! Realm()
    
    public func createUser() {
        try! LocalDataService.realm.write {
            if LocalDataService.realm.objects(UserData.self).isEmpty {
                let data = UserData()
                data.wallet = ""
                LocalDataService.realm.add(data)
            }
        }
    }
    
    public func editUserWallet(wallet: String) {
        try! LocalDataService.realm.write {
            LocalDataService.realm.objects(UserData.self)[0].wallet = wallet
        }
    }

    public func saveNFTLocation(id: String, latitude: Double, longitude: Double) {
        try! LocalDataService.realm.write {
            if LocalDataService.realm.objects(SavedNFT.self).filter({$0.id == id}).isEmpty {
                let newNFTlocation = SavedNFT()

                newNFTlocation.id = id
                newNFTlocation.latitude = latitude
                newNFTlocation.longitude = longitude
                
                LocalDataService.realm.add(newNFTlocation)
            }
        }
    }
    
    public func deleteNFTLocation(id: String) {
        try! LocalDataService.realm.write {
            let location = LocalDataService.realm.objects(SavedNFT.self).filter({$0.id == id})
            LocalDataService.realm.delete(location)
        }
    }
    
    public func printRealmPath() {
        print("realm url:\(Realm.Configuration.defaultConfiguration.fileURL!)")
    }
}
