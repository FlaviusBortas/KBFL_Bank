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
    var accounts: (checking: Checking, savings: Savings)?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSavingsAccountData()
        loadCheckingAccountData()
        loadAccounts()
        populateLabels()
 
        
        /// Print message to see if these are run and what path to document directory actually is
        print("Documents folder is \(documentsDirectory())\n")
        print("Data file path is \(dataFilePath1()), \(dataFilePath2())")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        saveSavingsAccountData()
        saveCheckingAccountData()
        populateLabels()

    }
    
    // MARK: - Private Implementations
    
//    func loadAccountsTuple() {
//
//        guard let checkingAccount = checkingAccount else { return }
//        guard let savingsAccount = savingsAccount else { return }
//
//        guard var tempCheckingAccount = accounts?.checking else { return }
//        tempCheckingAccount = checkingAccount
//
//        guard var tempSavingsAccount = accounts?.savings else { return }
//        tempSavingsAccount = savingsAccount
//
//    }
    
    func loadAccounts() {
        let storedAccounts = AccountDatabase.accounts
        
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

//MARK: - Data Persistance

/// Helper functions in order to get document directory/filepaths

extension TitleViewController {
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath1() -> URL {
        return documentsDirectory().appendingPathComponent("Accounts.plist")
    }
    
    func dataFilePath2() -> URL {
        return documentsDirectory().appendingPathComponent("Checking.plist")
    }
    
    func saveSavingsAccountData() {
        let encoder = PropertyListEncoder()
        do {
            let savingsData = try encoder.encode(savingsAccount)
            try savingsData.write(to: dataFilePath1(), options: Data.WritingOptions.atomic)
        } catch {
            print("Error encoding SavingsAccount")
        }
    }
    
    func saveCheckingAccountData() {
        let encoder = PropertyListEncoder()
        do {
            let checkingData = try encoder.encode(checkingAccount)
            try checkingData.write(to: dataFilePath2(), options: Data.WritingOptions.atomic)
        } catch {
            print("Error encoding Checkings Account")
        }
    }

    
    func loadSavingsAccountData() {
        let path = dataFilePath1()
        if let saving = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                savingsAccount = try  decoder.decode(Savings?.self, from: saving)
            } catch {
                print("Error decoding item array")
            }
            
        }
    }
    
    func loadCheckingAccountData() {
        let path = dataFilePath2()
        if let checking = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                checkingAccount = try decoder.decode(Checking?.self, from: checking)
            } catch {
                print("Error decoding item array")
            }
            
        }
    }
    
}
