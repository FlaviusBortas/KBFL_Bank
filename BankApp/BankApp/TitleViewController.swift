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
        checkingAccountBalance.text = String(currentCheckingBalance)
        savingsAccountBalance.text = String(currentSavingsBalance)
        // String(format: "Tip Amount: $%.02f", tipAmount)
        // String(format: "%0.3f", string)

    }

    //MARK: - Actions
    
    @IBAction func checkingInfoButton(_ sender: UIButton) {
    }
    
    @IBAction func savingsInfoButton(_ sender: UIButton) {
    }
    

}

