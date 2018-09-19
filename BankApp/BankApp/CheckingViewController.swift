//
//  CheckingViewController.swift
//  BankApp
//
//  Created by Kendall Poindexter on 9/17/18.
//  Copyright © 2018 KBFL. All rights reserved.
//

import UIKit

//MARK: - Protocol Definition

protocol CheckingViewControllerDelegate: class {
    func checkingViewController(_ controller: CheckingViewController, didFinishEditing item: Checking)
}

class CheckingViewController: UIViewController {

    
    @IBOutlet weak var withdrawAmount: UITextField!
    
    @IBOutlet weak var depositAmount: UITextField!
    
    @IBOutlet weak var checkingBalance: UILabel!
    
    
    //MARK: - Properties
    
//    var checkingData: Checking?
    weak var delegate: CheckingViewControllerDelegate?
    var checkingsAmount: Checking?

    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBalance()
//        loadCheckingAccount()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    //MARK: - Private Implementations
    
    private func loadBalance() {
        guard let balance = checkingsAmount?.balance else {
            print("Couldnt find current balance")
            return
        }
        checkingBalance.text = String(format: "%0.02f", balance)
    }
    
//    private func loadCheckingAccount(){
//        guard let currentBalance = self.checkingsAmount?.balance else { return }
//        self.checkingData = Checking(checkingsBalance: currentBalance, checkingWithdrawal: 0.0, checkingDeposit: 0.0)
//    }
    
    
    private func updateCheckingAccount() {
//        checkInput()
        
//        guard var currentBalance = checkingsAmount?.balance else { return }

        guard let withdrawalValue = withdrawAmount.text else { return }
        guard let withdrawalDouble = Double(withdrawalValue) else { return }
        
        guard let depositValue = depositAmount.text else { return }
        guard let depositDouble = Double(depositValue) else { return }
        
        guard let withdraw = self.checkingsAmount?.withdraw(withdrawAmount: withdrawalDouble) else {return}
        
        self.checkingsAmount?.balance -= withdraw
    
        checkingBalance.text = String(format: "%0.02f", checkingsAmount?.balance)
        
        guard let deposit = self.checkingsAmount?.deposit(depositAmount: depositDouble) else {return}
        
        self.checkingsAmount?.balance += deposit
//        currentBalance += deposit
        
        checkingBalance.text = String(format: "%0.02f", checkingsAmount?.balance)
        
//        let newBalance = updateBalance(withWithdrawing: withdrawalDouble, withDepositing: depositDouble)
//        
//        updateCheckingBalance(newBalance: newBalance)
        

    }
    
//    private func updateBalance(withWithdrawing withdrawal: Double, withDepositing deposit: Double) -> Double{
//        guard let updatedBalance = self.checkingData?.totalBalance(withdrawing: withdrawal, depositing: deposit) else { return 0.0 }
//
//        return updatedBalance
//    }
    
    private func updateCheckingBalance(newBalance balance: Double) {
        checkingsAmount?.balance = balance
        checkingBalance.text = String(format: "%0.02f", balance)
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
        updateCheckingAccount()
    }
    
    
}
