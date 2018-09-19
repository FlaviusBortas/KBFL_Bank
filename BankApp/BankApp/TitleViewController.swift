//
//  ViewController.swift
//  BankApp
//
//  Created by Flavius Bortas on 9/17/18.
//  Copyright © 2018 KBFL. All rights reserved.
//

import UIKit

class TitleViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var checkingAccountBalance: UILabel!
    @IBOutlet weak var savingsAccountBalance: UILabel!
    
    //MARK: - Properties
    
    var checkingAccount = Checking(balance: 1000)
    var savingsAccount = Savings(balance: 2000)
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        populateBalances()
        populateLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        populateBalances()
        populateLabels()
    }
    
    //MARK: - Private Implementations
    
//    func populateBalances() {
//        let checkingBalance = CheckingBalance()
//        let savingsBalance = SavingsBalance()
//
//        currentCheckingBalance = checkingBalance.balance
//        currentSavingsBalance = savingsBalance.balance
//    }
//
    func populateLabels() {
        checkingAccountBalance.text = String(format: "%0.02f", checkingAccount.balance)
        savingsAccountBalance.text = String(format: "%0.02f", savingsAccount.balance)
    }

    //MARK: - Actions

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
            
            savingsVC.savingsAmount = savingsAccount
            savingsVC.delegate = self
            print("made it to savings")
            
        case "SegueToChecking":
            guard let checkingVC = segue.destination as? CheckingViewController else {
                print("Failed to cast segue destination as CheckingVC")
                return
            }
            
            checkingVC.checkingsAmount = checkingAccount
            checkingVC.delegate = self
            print("made it to checkings")
            
        default:
            return
        }
    }
}

extension TitleViewController: SavingsViewControllerDelegate {
    func savingsViewController(_ controller: SavingsViewController, didFinishEditing item: Savings) {
    }
}


extension TitleViewController: CheckingViewControllerDelegate {
    func checkingViewController(_ controller: CheckingViewController, didFinishEditing item: Checking) {
    }
}
