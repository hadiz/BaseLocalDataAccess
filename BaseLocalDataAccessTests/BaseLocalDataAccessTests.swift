//
//  BaseLocalDataAccessTests.swift
//  BaseLocalDataAccessTests
//
//  Created by Hadi Zamani on 10/14/16.
//  Copyright © 2016 SomeSimpleSolutions. All rights reserved.
//

import XCTest
@testable import BaseLocalDataAccess

class SortObjectTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testToNSSortDescriptor() {
        let sortObject =  SortObject(fieldName: "id", direction: .ascending)
        let sortDescriptors = sortObject.toNSSortDescriptor()
        let directSortDescriptor =  NSSortDescriptor(key: "id", ascending: true)
        
        guard let uSortDescriptors = sortDescriptors, uSortDescriptors.count > 0 else{
            XCTFail("toNSSortDescriptor should create NSSortDescriptor object")
            return
        }
        let sortDescriptor = uSortDescriptors[0]
        
        XCTAssertEqual(sortDescriptor.key, directSortDescriptor.key, "Sort field should set")
        XCTAssertEqual(sortDescriptor.ascending, directSortDescriptor.ascending, "direction should set correctly")
    }
}
