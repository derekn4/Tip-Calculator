//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Derek Nguyen on 4/4/20.
//  Copyright © 2020 derekn4. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var splitLabel: UILabel!
    
    @IBOutlet weak var splitTotall: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    @IBAction func stepValueChange(_ sender: UIStepper) {
        splitLabel.text = Int(sender.value).description
        
        let bill = Double(billField.text!) ?? 0
        
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let tip = bill*tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill+tip
        
        if let splitText = splitLabel.text, let splitNum = Double(splitText){
            let split = total/splitNum
            splitTotall.text = String(format: "$%.2f", split)
        }
    }
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    func initializeTips() {
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        splitTotall.text = "$0.00"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.billField.becomeFirstResponder()
        
        initializeTips()
        
    }


    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let bill = Double(billField.text!) ?? 0
        
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let tip = bill*tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill+tip
        
        if let splitText = splitLabel.text, let splitNum = Double(splitText){
            let split = total/splitNum
            splitTotall.text = String(format: "$%.2f", split)
        }
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
}

