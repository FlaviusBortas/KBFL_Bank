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
    
    var currentCheckingBalance = 0.00
    var currentSavingsBalance = 0.00
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateBalances()
        populateLabels()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: - Private Implementations
    
    func populateBalances() {
        let checkingBalance = CheckingBalance()
        let savingsBalance = SavingsBalance()
        
        currentCheckingBalance = checkingBalance.balance
        currentSavingsBalance = savingsBalance.balance
    }
    
    func populateLabels() {
        checkingAccountBalance.text = String(format: "%0.02f", currentCheckingBalance)
        savingsAccountBalance.text = String(format: "%0.02f", currentSavingsBalance)
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
            
            savingsVC.currentBalance = currentSavingsBalance
            savingsVC.delegate = self
            print("made it to savings")
            
        case "SegueToChecking":
            guard let checkingVC = segue.destination as? CheckingViewController else {
                print("Failed to cast segue destination as CheckingVC")
                return
            }
            
            checkingVC.currentBalance = currentCheckingBalance
            checkingVC.delegate = self
            print("made it to checkings")
            
        default:
            return
        }
    }
    

}

extension TitleViewController: SavingsViewControllerDelegate {
    func savingsViewController(_ controller: SavingsViewController, didFinishEditing item: Savings) {
        savingsAccountBalance.text = String(item.savingsBalance)
    }
}


extension TitleViewController: CheckingViewControllerDelegate {
    func checkingViewController(_ controller: CheckingViewController, didFinishEditing item: Checking) {
        checkingAccountBalance.text = String(item.checkingBalance)
    }
}

