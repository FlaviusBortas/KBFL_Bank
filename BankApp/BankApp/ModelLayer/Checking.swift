//
//  Checkings.swift
//  BankApp
//
//  Created by Flavius Bortas on 9/17/18.
//  Copyright © 2018 KBFL. All rights reserved.
//

import Foundation

class Checking {
    var balance: Double
//    var checkingWithdrawal: Double
//    var checkingDeposit: Double
    
    init(balance: Double) {
        self.balance = balance
//        self.checkingWithdrawal = checkingWithdrawal
//        self.checkingDeposit = checkingDeposit
    }
    
    func withdraw(withdrawAmount withdraw: Double) -> Double {
        return abs(self.balance - withdraw)
    }
    
    func deposit(depositAmount deposit: Double) -> Double {
        return abs(self.balance + deposit)
    }

    
}

//extension Checking: Account {
//    var currentBalance: Double {
//        get {
//            return checkingBalance
//        }
//        set {
//            checkingBalance = newValue
//        }
//    }
//
//    var withdrawal: Double {
//        get {
//            return checkingWithdrawal
//        }
//        set {
//            checkingWithdrawal = newValue
//        }
//    }
//
//    var deposit: Double {
//        get {
//            return checkingDeposit
//        }
//        set {
//            checkingDeposit = newValue
//        }
//    }
//
//    func totalBalance(withdrawing withdrawal: Double, depositing deposit: Double) -> Double {
//         let transaction = deposit - withdrawal
//         return currentBalance + transaction
//    }
//
//
//}

struct CheckingBalance {
    var balance = 100.00
}
