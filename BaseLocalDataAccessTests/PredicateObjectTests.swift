//
//  PredicateObjectTests.swift
//  BaseLocalDataAccess
//
//  Created by Hadi Zamani on 10/18/16.
//  Copyright © 2016 SomeSimpleSolutions. All rights reserved.
//

import XCTest
@testable import BaseLocalDataAccess

class PredicateObjectTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testToNSPredicate() {
        let predicateObject = PredicateObject(fieldName: "id", operatorName: .equal, value: "1")
        let predicate = predicateObject.toNSPredicate()
        let directPredicate = NSPredicate(format: "id == %@", argumentArray: ["1"])
        XCTAssertEqual(predicate!.predicateFormat, directPredicate.predicateFormat, "toNSPredicate should format the prdicate correctly")
    }
}
