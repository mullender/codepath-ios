//
//  SettingsViewController.swift
//  tipper
//
//  Created by Matthijs Mullender on 10/9/15.
//  Copyright © 2015 Matthijs Mullender. All rights reserved.
//

import UIKit
import Foundation

class SettingsViewController: UIViewController {
    @IBOutlet var tipTypeSegmentedControl : UISegmentedControl!
 
    
    let tipCalc = ExactTipCalculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        switch defaults.objectForKey("tipper") as? String ?? "exact"
        {
        case "all":
            tipTypeSegmentedControl.selectedSegmentIndex = 0
        case "tip":
            tipTypeSegmentedControl.selectedSegmentIndex = 1
        case "exact":
            tipTypeSegmentedControl.selectedSegmentIndex = 2
        default:
            break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func TipTypeChanged(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        switch sender.selectedSegmentIndex
        {
        case 0:
            defaults.setObject("all", forKey: "tipper")
        case 1:
            defaults.setObject("tip", forKey: "tipper")
        case 2:
            defaults.setObject("exact", forKey: "tipper")
        default:
            break; 
        }
        
        
    }
}
