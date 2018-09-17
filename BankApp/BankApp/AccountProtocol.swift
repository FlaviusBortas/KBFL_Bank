//
//  AccountProtocol.swift
//  BankApp
//
//  Created by Britney Smith on 9/17/18.
//  Copyright © 2018 KBFL. All rights reserved.
//

import Foundation

protocol Account: class {
    var currentBalance: Double { get set }
    var withdrawal: Double { get set }
    var deposit: Double { get set }
    
    func totalBalance(_ withdrawal: Double, _ deposit: Double) -> Double
        // var transaction = deposit - withdrawal
        // return currentBalance + transactionn
   
}
