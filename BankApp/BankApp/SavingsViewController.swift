//
//  SavingsViewController.swift
//  BankApp
//
//  Created by Kendall Poindexter on 9/17/18.
//  Copyright © 2018 KBFL. All rights reserved.
//

import UIKit

//MARK: - Protocol Definition

protocol SavingsViewControllerDelegate: class {
    func savingsViewController(_ controller: SavingsViewController, didFinishEditing item: Savings)
}

class SavingsViewController: UIViewController {
    // MARK: - Outlets
    
    @IBOutlet weak var withdrawAmountTextField: UITextField!
    @IBOutlet weak var depositAmountTextField: UITextField!
    @IBOutlet weak var savingsBalanceLabel: UILabel!
    
    // MARK: - Properties
    
    weak var delegate: SavingsViewControllerDelegate?
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
