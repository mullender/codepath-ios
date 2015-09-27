//
//  TipCalculator.swift
//  tipper
//
//  Created by Matthijs Mullender on 9/26/15.
//  Copyright © 2015 Matthijs Mullender. All rights reserved.
//

import Foundation

class ExactTipCalculator {
    
    // 2
    let total: Double
    let taxPct: Double
    let subtotal: Double
    let possibleTipsInferred = [15, 18, 20]
    
    
    // 3
    init(total: Double, taxPct: Double) {
        self.total = total
        self.taxPct = taxPct
        subtotal = total / (taxPct + 1)
    }
    
    // 4
    func calcTipWithTipPct(tipPct: Int) -> Double {
        return subtotal * (Double(tipPct)/100.0)
    }
    
    // 1
    func returnPossibleTips() -> [Int: Double] {
        // 2
        var retval = [Int: Double]()
        for possibleTip in possibleTipsInferred {
            let intPct = possibleTip
            // 3
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
        
    }
    
}
