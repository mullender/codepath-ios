//
//  TipCalculator.swift
//  tipper
//
//  Created by Matthijs Mullender on 9/26/15.
//  Copyright © 2015 Matthijs Mullender. All rights reserved.
//

import Foundation

class ExactTipCalculator {
    
    var total: Double = 0.0
    var taxPct: Double = 0.0
    private var subtotal: Double {
        get {
            return total / (taxPct + 1)
        }
    }
    private let possibleTipsInferred = [15, 18, 20]

    
    private func calcTipWithTipPct(tipPct: Int) -> Double {
        return subtotal * (Double(tipPct)/100.0)
    }
    
    func returnPossibleTips() -> [Int: Double] {
        var retval = [Int: Double]()
        for possibleTip in possibleTipsInferred {
            let intPct = possibleTip
            // 3
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
    }
}
