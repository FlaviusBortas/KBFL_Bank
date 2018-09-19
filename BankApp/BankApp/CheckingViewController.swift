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
    
    var checkingData: Checking?
    weak var delegate: CheckingViewControllerDelegate?
    var currentBalance: Double?

    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBalance()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    func loadBalance() {
        guard let balance = currentBalance else {
            print("Couldnt find current balance")
            return
        }
        checkingBalance.text = String(format: "%0.02f", balance)
    }
    
    
    func updateBalance(withWithdrawing withdrawal: Double, withDepositing depositing: Double) -> Double{
        return 0.0
    }
    
    func loadCheckingAccount(checkingAccount account: Checking?) {
        guard let currentBalance = self.currentBalance else { return }
        guard let withdrawal = withdrawAmount.text else { return }
        guard let withdrawalDouble = Double(withdrawal) else { return }
        guard let deposit = depositAmount.text else { return }
        guard let depositDouble = Double(deposit) else { return }
        
        self.checkingData = Checking(checkingsBalance: currentBalance, checkingWithdrawal: withdrawalDouble, checkingDeposit: depositDouble)
        
        var updatedBalance = self.checkingData?.totalBalance(withdrawing: withdrawalDouble, depositing: depositDouble)
    }
    
}
