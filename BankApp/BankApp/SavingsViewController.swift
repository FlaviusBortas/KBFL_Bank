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
        savingsBalance.text = String(format: "%0.02f", balance)
    }

}
