//
//  SavingsViewController.swift
//  BankApp
//
//  Created by Kendall Poindexter on 9/17/18.
//  Copyright © 2018 KBFL. All rights reserved.
//

import UIKit

//MARK: - Protocol Definition

class SavingsViewController: UIViewController {
    // MARK: - Outlets
    
    @IBOutlet weak var withdrawAmountTextField: UITextField!
    @IBOutlet weak var depositAmountTextField: UITextField!
    @IBOutlet weak var savingsBalanceLabel: UILabel!
    
    // MARK: - Properties
    
    var account: Savings?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: - Private Implementations
    
    private func updateUI() {
        guard let account = account else { return }
        
        savingsBalanceLabel.text = account.formattedAmount
    }
    
    private func updateSavingsAccount() {
        guard let account = account else { return }
        
        if let withdrawalAmount = withdrawAmountTextField.text, let amount = Double(withdrawalAmount) {
            account.withdraw(amount: amount)
            if account.balance < 0 {
                let overdraftAlert = UIAlertController(title: "Overdraft", message: "You overdrafted your account.  Please deposit funds.", preferredStyle: .alert)
                
                overdraftAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                //overdraftAlert.addAction(UIAlertAction(title: "Bad", style: .cancel, handler: nil))
                present(overdraftAlert, animated: true)
                account.overdraft()
            }
    
        }
        
        if let depositAmount = depositAmountTextField.text, let amount = Double(depositAmount) {
            account.deposit(amount: amount)
        }
    }
    
    // MARK: - Actions
    
    @IBAction func updateBalanceButton(_ sender: UIButton) {
        updateSavingsAccount()
        updateUI()
    }
}
