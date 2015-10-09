//
//  ViewController.swift
//  tipper
//
//  Created by Matthijs Mullender on 9/26/15.
//  Copyright © 2015 Matthijs Mullender. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet var totalTextField : UITextField!
    @IBOutlet var taxTextField : UITextField!
    @IBOutlet var taxPctLabel : UILabel!
    @IBOutlet var resultsTextView : UITextView!
    
    let tipCalc = TipCalculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateUI()
    }
    
    override func viewWillAppear(animated: Bool) {
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateUI() {
        tipCalc.total = strtod(totalTextField.text!, nil) ?? 1.0
        tipCalc.tax = strtod(taxTextField.text!,nil) ?? 0.0
        taxPctLabel.text = String(format: "%.1f%%",100 * tipCalc.tax/tipCalc.subtotal)
        
        let possibleTips = tipCalc.returnPossibleTips()
        var results = "tip-%      tip  total+tip\n"+"=========================\n"
        for tipValue in possibleTips {
            let tipPct = tipValue/tipCalc.subtotal * 100
            let tipPctStr = String(format: "%4.1f",tipPct)
            let tipValStr = String(format: "%7.2f",tipValue)
            let totalValStr = String(format: "%9.2f",tipValue+tipCalc.total)

            
            results += "\(tipPctStr)%  \(tipValStr)  \(totalValStr)\n"
        }
        resultsTextView.text = results
        
    }

    @IBAction func totalValueChanged(sender: AnyObject) {
        updateUI()
    }
    @IBAction func taxValueChanged(sender: AnyObject) {
        updateUI()
    }
    
    @IBAction func viewTapped(sender: AnyObject) {
        totalTextField.endEditing(false)
        taxTextField.endEditing(false)
        updateUI()
    }
}

