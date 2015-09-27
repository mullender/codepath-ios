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
    
    func testTipValue() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let tipCalc = ExactTipCalculator(total: 110.0, taxPct: 0.1)
        let tips = tipCalc.returnPossibleTips()
        XCTAssertEqual(tips[20], 20.0)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
            let tipCalc = ExactTipCalculator(total: 100.0, taxPct: 0.1)
            tipCalc.returnPossibleTips()
        }
    }
    
}
