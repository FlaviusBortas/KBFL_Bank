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
        setNavBarBackgroundColor()
        setTitleTextColor()
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
    
    func setNavBarBackgroundColor() {
        navigationController?.navigationBar.backgroundColor = UIColor.blue
    }
    
    func setTitleTextColor() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "Copperplate", size: 35)!]
    }
    
    // MARK: - Actions
    
    @IBAction func updateBalanceButton(_ sender: UIButton) {
        updateSavingsAccount()
        updateUI()
    }
}
