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
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK: - Actions
    
    @IBAction func checkingInfoButton(_ sender: UIButton) {
    }
    
    @IBAction func savingsInfoButton(_ sender: UIButton) {
    }
    

}

