//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 1
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

// 6
let tipCalc = ExactTipCalculator(total: 33.25, taxPct: 0.09)
tipCalc.returnPossibleTips()
print(String(format: "a float number: %.1f%%", 10.08))
print(strtod("www",nil))