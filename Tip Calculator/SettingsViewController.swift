//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Derek Nguyen on 9/1/20.
//  Copyright © 2020 derekn4. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var darkModeLabel: UILabel!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    let switchKey = "keyName";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (UserDefaults.standard.bool(forKey:"keyName")){
            Settings.sharedInstance.backgroundColor = UIColor.black;
            Settings.sharedInstance.textColor = UIColor.white;
        } else {
            Settings.sharedInstance.backgroundColor = UIColor.white;
            Settings.sharedInstance.textColor = UIColor.black;
        }
        
        self.view.backgroundColor = Settings.sharedInstance.backgroundColor;
        darkModeLabel.textColor = Settings.sharedInstance.textColor;
        
        if (UserDefaults.standard.bool(forKey: switchKey)){
            darkModeSwitch.isOn = true;
        } else {
            darkModeSwitch.isOn = false;
        }

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.view.backgroundColor = Settings.sharedInstance.backgroundColor;
        darkModeLabel.textColor = Settings.sharedInstance.textColor;
        
    }

    
    @IBAction func switchChange(_ sender: Any) {
        UserDefaults.standard.set(darkModeSwitch.isOn, forKey: switchKey)
        
        if (darkModeSwitch.isOn){
            Settings.sharedInstance.backgroundColor = UIColor.black;
            Settings.sharedInstance.textColor = UIColor.white;
        } else{
            Settings.sharedInstance.backgroundColor = UIColor.white;
            Settings.sharedInstance.textColor = UIColor.black;
        }
        self.view.backgroundColor = Settings.sharedInstance.backgroundColor;
        darkModeLabel.textColor = Settings.sharedInstance.textColor;
    }
    
}
