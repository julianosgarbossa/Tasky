//
//  UserDefaultsPersistence.swift
//  Tasky
//
//  Created by Juliano Sgarbossa on 26/06/25.
//

import Foundation

protocol PersistenceProtocol {
    func saveData(data: Data, key: String)
    func loadData(key: String) -> Data?
}

class UserDefaultsPersistence: PersistenceProtocol {
    func saveData(data: Data, key: String) {
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func loadData(key: String) -> Data? {
        return UserDefaults.standard.data(forKey: key)
    }
}
