//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Derek Nguyen on 4/4/20.
//  Copyright © 2020 derekn4. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tipText: UILabel!
    @IBOutlet weak var splitText: UILabel!
    @IBOutlet weak var totalText: UILabel!
    @IBOutlet weak var splitTotalText: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var splitLabel: UILabel!
    
    @IBOutlet weak var splitTotall: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    let tipPercentages = [0.15, 0.18, 0.2]
    
    @IBAction func stepValueChange(_ sender: UIStepper) {
        splitLabel.text = Int(sender.value).description
        
        let bill = Double(billField.text!) ?? 0
        
        
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
        billField.backgroundColor = UIColor.lightGray;
        if (UserDefaults.standard.bool(forKey:"keyName")){
            Settings.sharedInstance.backgroundColor = UIColor.black;
            Settings.sharedInstance.textColor = UIColor.white;
            
            tipControl.backgroundColor = Settings.sharedInstance.textColor;
            stepper.backgroundColor = Settings.sharedInstance.textColor;
            
            tipControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Settings.sharedInstance.backgroundColor], for: UIControl.State.selected)
        } else {
            Settings.sharedInstance.backgroundColor = UIColor.white;
            Settings.sharedInstance.textColor = UIColor.black;
            
            tipControl.backgroundColor = Settings.sharedInstance.backgroundColor;
            stepper.backgroundColor = Settings.sharedInstance.textColor;
            tipControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Settings.sharedInstance.textColor], for: UIControl.State.selected)
            
        }
        self.billField.becomeFirstResponder();
        switchColor();
        initializeTips();
    }
    
    override func viewDidAppear(_ animated: Bool) {
        switchColor();
        billField.becomeFirstResponder();
    }


    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let bill = Double(billField.text!) ?? 0
        
        let tip = bill*tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill+tip
        
        if let splitText = splitLabel.text, let splitNum = Double(splitText){
            let split = total/splitNum
            splitTotall.text = String(format: "$%.2f", split)
        }
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    func switchColor() {
        self.view.backgroundColor = Settings.sharedInstance.backgroundColor;
        billField.textColor = Settings.sharedInstance.textColor;
        splitTotall.textColor = Settings.sharedInstance.textColor;
        
        tipLabel.textColor = Settings.sharedInstance.textColor;
        totalLabel.textColor = Settings.sharedInstance.textColor;
        splitLabel.textColor = Settings.sharedInstance.textColor;
        
        tipText.textColor = Settings.sharedInstance.textColor;
        splitText.textColor = Settings.sharedInstance.textColor;
        totalText.textColor = Settings.sharedInstance.textColor;
        splitTotalText.textColor = Settings.sharedInstance.textColor;
    }
    
}

