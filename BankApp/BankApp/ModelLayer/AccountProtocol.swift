//
//  AccountProtocol.swift
//  BankApp
//
//  Created by Britney Smith on 9/17/18.
//  Copyright © 2018 KBFL. All rights reserved.
//

import Foundation

enum AccountType: String {
    case checking = "Checking"
    case saving = "Saving"
}

protocol Account: AnyObject {
    var balance: Double { get set }
    var type: AccountType { get }
    var formattedAmount: String { get }

    func withdraw(amount: Double)
    func deposit(amount: Double)
}

extension Account {
    var formattedAmount: String {
        return String(format: "$%0.02f", balance)
    }
    
    func withdraw(amount: Double) {
        balance -= amount
    }

    func deposit(amount: Double) {
        balance += amount
    }
}
