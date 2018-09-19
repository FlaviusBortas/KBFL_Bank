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

    
    //MARK: - Outlets
    
    @IBOutlet weak var withdrawAmount: UITextField!
    
    @IBOutlet weak var depositAmount: UITextField!
    
    @IBOutlet weak var savingsBalance: UILabel!
    
    
    //MARK: - Properties
    
    var savingsData: Savings?
    weak var delegate: SavingsViewControllerDelegate?
    var currentBalance: Double?
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBalance()
        loadSavingsAccount()
   

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Private Implementations
    
    private func loadBalance() {
        guard let balance = currentBalance else {
            print("Couldnt find current balance")
            return
        }
        savingsBalance.text = String(format: "%0.02f", balance)
    }
    
    private func loadSavingsAccount(){
        guard let currentBalance = self.currentBalance else { return }
        self.savingsData = Savings(savingsBalance: currentBalance, savingsWithdrawal: 0.0, savingsDeposit: 0.0)
    }
    
    
    private func updateSavingsAccount() {
        checkInput()
        
        guard let withdrawal = withdrawAmount.text else { return }
        guard let withdrawalDouble = Double(withdrawal) else { return }
        guard let deposit = depositAmount.text else { return }
        guard let depositDouble = Double(deposit) else { return }
        
        self.savingsData?.savingsWithdrawal = withdrawalDouble
        self.savingsData?.savingsDeposit = depositDouble
        
        let newBalance = updateBalance(withWithdrawing: withdrawalDouble, withDepositing: depositDouble)
        
        updateSavingsBalance(newBalance: newBalance)
        
        
    }
    
    private func updateBalance(withWithdrawing withdrawal: Double, withDepositing deposit: Double) -> Double{
        guard let updatedBalance = self.savingsData?.totalBalance(withdrawing: withdrawal, depositing: deposit) else { return 0.0 }
        
        return updatedBalance
    }
    
    private func updateSavingsBalance(newBalance balance: Double) {
        savingsData?.savingsBalance = balance
        savingsBalance.text = String(format: "%0.02f", balance)
    }
    
    private func checkInput() {
        if withdrawAmount.text?.count == 0 {
            withdrawAmount.text = "0.0"
        }
        if depositAmount.text?.count == 0 {
            depositAmount.text = "0.0"
        }
    }
    
    
    //MARK: - Actions
    
    @IBAction func updateBalanceButton(_ sender: UIButton) {
        updateSavingsAccount()
        delegate?.savingsViewController(self, didFinishEditing: savingsData!)
    }
    
    

}
