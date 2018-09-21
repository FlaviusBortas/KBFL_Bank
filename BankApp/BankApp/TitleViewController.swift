//
//  ViewController.swift
//  BankApp
//
//  Created by Flavius Bortas on 9/17/18.
//  Copyright © 2018 KBFL. All rights reserved.
//

import UIKit

class TitleViewController: UIViewController {
    // MARK: - Outlets
    
    @IBOutlet weak var checkingAccountBalanceLabel: UILabel!
    @IBOutlet weak var savingsAccountBalanceLabel: UILabel!
    
    // MARK: - Properties

    var checkingAccount: Checking?
    var savingsAccount: Savings?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBarBackgroundColor()
        setTitleTextColor()
        loadAccounts()
        populateLabels()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        populateLabels()
    }
    
    // MARK: - Private Implementations
    
    func loadAccounts() {
        let storedAccounts = AccountDatabase.shared.accounts
        
        if let checkingAmount = storedAccounts["Checking"] {
            checkingAccount = Checking(balance: checkingAmount, type: .checking)
        }
        
        if let savingsAmount = storedAccounts["Savings"] {
            savingsAccount = Savings(balance: savingsAmount, type: .saving)
        }
    }
    
    func populateLabels() {
        if let checkings = checkingAccount {
            checkingAccountBalanceLabel.text = checkings.formattedAmount
        }
        
        if let savings = savingsAccount {
            savingsAccountBalanceLabel.text = savings.formattedAmount
        }
    }
    
    
    func setTitleTextColor() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "Copperplate", size: 35)!]
    }
    
    func setNavBarBackgroundColor() {
        navigationController?.navigationBar.backgroundColor = UIColor.blue
    }
    

    // MARK: - Actions

    @IBAction func checkingInfoButton(_ sender: UIButton) {
    }

    @IBAction func savingsInfoButton(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "SegueToSavings":
            guard let savingsVC = segue.destination as? SavingsViewController else {
                print("Failed to cast segue destination as SavingsVC")
                return
            }
            
            savingsVC.account = savingsAccount
            print("made it to savings")
            
        case "SegueToChecking":
            guard let checkingVC = segue.destination as? CheckingViewController else {
                print("Failed to cast segue destination as CheckingVC")
                return
            }

            checkingVC.account = checkingAccount
            print("made it to checkings")
            
        default: return
        }
    }
}
