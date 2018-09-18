//
//  Savings.swift
//  BankApp
//
//  Created by Britney Smith on 9/17/18.
//  Copyright © 2018 KBFL. All rights reserved.
//

import Foundation

class Savings {
    var savingsBalance: Double
    var savingsWithdrawal: Double
    var savingsDeposit: Double
    
    init(savingsBalance: Double, savingsWithdrawal: Double, savingsDeposit: Double) {
        self.savingsBalance = savingsBalance
        self.savingsWithdrawal = savingsWithdrawal
        self.savingsDeposit = savingsDeposit
    }
}
extension Savings: Account {
    var currentBalance: Double {
        get {
            return savingsBalance
        }
        set {
            savingsBalance = newValue
        }
    }
    
    var withdrawal: Double {
        get {
            return savingsWithdrawal
        }
        set {
            savingsWithdrawal = newValue
        }
    }
    
    var deposit: Double {
        get {
            return savingsDeposit
        }
        set {
            savingsDeposit = newValue
        }
    }
    
    func totalBalance(withdrawing withdrawal: Double, depositing deposit: Double) -> Double {
        let transaction = deposit - withdrawal
        return currentBalance + transaction
    }
    
    
}

struct SavingsBalance {
    var balance = 200.00
}
