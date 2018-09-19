//
//  Savings.swift
//  BankApp
//
//  Created by Britney Smith on 9/17/18.
//  Copyright © 2018 KBFL. All rights reserved.
//

import Foundation

class Savings {
    var balance: Double
//    var savingsWithdrawal: Double
//    var savingsDeposit: Double
    
    init(balance: Double) {
        self.balance = balance
//        self.savingsWithdrawal = savingsWithdrawal
//        self.savingsDeposit = savingsDeposit
    }
    
    func withdraw(withdrawAmount withdraw: Double) -> Double {
        return abs(balance - withdraw)
    }
    
    func deposit(depositAmount deposit: Double) -> Double {
        return abs(deposit + balance)
    }
}
//extension Savings: Account {
//    var currentBalance: Double {
//        get {
//            return savingsBalance
//        }
//        set {
//            savingsBalance = newValue
//        }
//    }
//    
//    var withdrawal: Double {
//        get {
//            return savingsWithdrawal
//        }
//        set {
//            savingsWithdrawal = newValue
//        }
//    }
//    
//    var deposit: Double {
//        get {
//            return savingsDeposit
//        }
//        set {
//            savingsDeposit = newValue
//        }
//    }
//    
//    func totalBalance(withdrawing withdrawal: Double, depositing deposit: Double) -> Double {
//        let transaction = deposit - withdrawal
//        return currentBalance + transaction
//    }
//    
//    
//}

struct SavingsBalance {
    var balance = 200.00
}
