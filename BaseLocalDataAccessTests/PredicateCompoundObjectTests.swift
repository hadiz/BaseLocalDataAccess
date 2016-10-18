//
//  PredicateCompoundObjectTests.swift
//  BaseLocalDataAccess
//
//  Created by Hadi Zamani on 10/18/16.
//  Copyright © 2016 SomeSimpleSolutions. All rights reserved.
//

import XCTest
@testable import BaseLocalDataAccess

class PredicateCompoundObjectTests: XCTestCase {
    var predicateCompoundObject: PredicateCompoundObject?
    override func setUp() {
        super.setUp()
        predicateCompoundObject = PredicateCompoundObject(compoundOperator: .and)
    }
    
    override func tearDown() {
        predicateCompoundObject = nil
        super.tearDown()
    }
    
    func testToNSPredicateWithZeroPredicateObject() {
        let predicate = predicateCompoundObject?.toNSPredicate()
        XCTAssertNil(predicate, "toNSPredicate should return nil if no compoundObject appended")
    }
    
    func testToNSPredicateWithOnePredicateObject() {
        predicateCompoundObject?.appendPredicate(PredicateObject(fieldName: "id", operatorName: .equal, value: "1"))
        let predicate = predicateCompoundObject?.toNSPredicate()

        XCTAssertTrue(predicate!.isKind(of: NSPredicate.self) ,"toNSPredicate should return PredicateObject if one compoundObject appended")
    }
    
    func testToNSPredicateWithMoreThanOnePredicateObject() {
        predicateCompoundObject?.appendPredicate(PredicateObject(fieldName: "id", operatorName: .equal, value: "1"))
        predicateCompoundObject?.appendPredicate(PredicateObject(fieldName: "name", operatorName: .equal, value: "John"))
        
        let predicate = predicateCompoundObject?.toNSPredicate()

        XCTAssertTrue(predicate!.isMember(of: NSCompoundPredicate.self) ,"toNSPredicate should return NSCompoundPredicate if more than one compoundObject appended")
    }
}
