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
    
    let tipCalc = ExactTipCalculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateUI() {
        tipCalc.total = strtod(totalTextField.text!, nil)
        let taxAmount = strtod(taxTextField.text!,nil)
        tipCalc.taxPct = tipCalc.total > 0 ? taxAmount/tipCalc.total : 0.0
        taxPctLabel.text = String(format: "%.1f%%",tipCalc.taxPct*100.0)
        
        let possibleTips = tipCalc.returnPossibleTips()
        var results = ""
        for (tipPct, tipValue) in possibleTips {
            let tipPctStr = String(format: "%.1f",Double(tipPct))
            let tipValStr = String(format: "%.2f",tipValue)

            results += "\(tipPctStr)%: \(tipValStr)\n"
        }
        // 5
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

