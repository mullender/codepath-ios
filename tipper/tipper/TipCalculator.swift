//
//  TipCalculator.swift
//  tipper
//
//  Created by Matthijs Mullender on 9/26/15.
//  Copyright © 2015 Matthijs Mullender. All rights reserved.
//

import Foundation

class TipCalculator {
    
    var total: Double = 0.0
    var tax: Double = 0.0
    var subtotal: Double {
        get {
            return total - tax
        }
    }
    
    private let possibleTipsInferred = [12.5, 15.0, 17.5, 20.0]

    
    internal func calcTipExact(tipPct: Double) -> Double {
        return subtotal * tipPct/100.0
    }
    
    internal func calcTipRoundGrandTotal(tipPct: Double) -> Double {
        return round(total+(subtotal * tipPct/100.0))-total
    }
    
    internal func calcTipRoundTip(tipPct: Double) -> Double {
        return round(subtotal * tipPct/100.0)
    }
    
   
    func returnPossibleTips() -> [Double] {
        let defaults = NSUserDefaults.standardUserDefaults()
        let mode = defaults.objectForKey("tipper") as? String ?? "exact"
        
        var retval = [Double]()
        for possibleTip in possibleTipsInferred {
            switch mode
            {
            case "exact":
                retval.append(calcTipExact(possibleTip))
            case "all":
                retval.append(calcTipRoundGrandTotal(possibleTip))
            case "tip":
                retval.append(calcTipRoundTip(possibleTip))
            default:
                break
            }
        }
        return retval
    }
}
