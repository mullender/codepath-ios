//
//  TipCalculatorTests.swift
//  tipper
//
//  Created by Matthijs Mullender on 9/26/15.
//  Copyright © 2015 Matthijs Mullender. All rights reserved.
//

import Foundation

import XCTest
@testable import tipper

class TipCalculatorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTipValueExact() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let tipCalc = TipCalculator()
        tipCalc.total = 99.97
        tipCalc.tax = 8.0
        let tip = tipCalc.calcTipExact(20)
        XCTAssertEqualWithAccuracy(tip, 18.394, accuracy: 0.001)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
            let tipCalc = TipCalculator()
            tipCalc.total = 110
            tipCalc.tax = 10
            tipCalc.returnPossibleTips()
        }
    }
    
    func testTipValueRoundTip() {
        let tipCalc = TipCalculator()
        tipCalc.total = 99.97
        tipCalc.tax = 8.0
        let tip = tipCalc.calcTipRoundTip(20)
        XCTAssertEqualWithAccuracy(tip, 18.0, accuracy: 0.001)
    }
    func testTipValueRoundGrandTotal() {
        let tipCalc = TipCalculator()
        tipCalc.total = 99.97
        tipCalc.tax = 8.0
        let tip = tipCalc.calcTipRoundGrandTotal(20)
        XCTAssertEqualWithAccuracy(tip, 18.03, accuracy: 0.001)
    }

}
