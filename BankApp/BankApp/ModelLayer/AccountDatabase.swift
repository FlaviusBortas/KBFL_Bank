//
//  AccountDatabase.swift
//  BankApp
//
//  Created by Flavius Bortas on 9/19/18.
//  Copyright © 2018 KBFL. All rights reserved.
//

import Foundation

class AccountDatabase: Codable {
    var accounts = ["Checking": 1000.0, "Savings": 2000.0]
    
    static let shared = AccountDatabase()
    
    private init() {
        
    }
    
}

extension AccountDatabase {
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dateFieldPath() -> URL {
        return documentsDirectory().appendingPathComponent("Account.plist")
    }
    
    func saveAccount() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(accounts)
            try data.write(to: dateFieldPath(), options: Data.WritingOptions.atomic)
            print("saved", accounts)
        } catch {
            print(error)
        }
    }
    
    func loadAccount() {
        let path = dateFieldPath()
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                accounts = try decoder.decode([String: Double].self, from: data)
                print(accounts)
            } catch {
                print(error)
            }
        }
    }
    
}
