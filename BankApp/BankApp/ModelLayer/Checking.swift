//
//  Checkings.swift
//  BankApp
//
//  Created by Flavius Bortas on 9/17/18.
//  Copyright © 2018 KBFL. All rights reserved.
//

import Foundation

class Checking {
    var checkingBalance: Double
    var checkingWithdrawal: Double
    var checkingDeposit: Double
    
    init(checkingsBalance: Double, checkingWithdrawal: Double, checkingDeposit: Double) {
        self.checkingBalance = checkingsBalance
        self.checkingWithdrawal = checkingWithdrawal
        self.checkingDeposit = checkingDeposit
    }

    
}

extension Checking: Account {
    var currentBalance: Double {
        get {
            return checkingBalance
        }
        set {
            checkingBalance = newValue
        }
    }
    
    var withdrawal: Double {
        get {
            return checkingWithdrawal
        }
        set {
            checkingWithdrawal = newValue
        }
    }
    
    var deposit: Double {
        get {
            return checkingDeposit
        }
        set {
            checkingDeposit = newValue
        }
    }
    
    func totalBalance(withdrawing withdrawal: Double, depositing deposit: Double) -> Double {
         let transaction = deposit - withdrawal
         return currentBalance + transaction
    }
    
    
}

struct CheckingBalance {
    var balance = 100.00
}
