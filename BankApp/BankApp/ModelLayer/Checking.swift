//
//  Checkings.swift
//  BankApp
//
//  Created by Flavius Bortas on 9/17/18.
//  Copyright © 2018 KBFL. All rights reserved.
//

import Foundation

class Checking: Account {
    var balance: Double
    let type: AccountType
    
    init(balance: Double, type: AccountType) {
        self.balance = balance
        self.type = type
    }
}
