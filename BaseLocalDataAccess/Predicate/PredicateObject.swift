//
//  PredicateObject.swift
//  MemorizeItForever
//
//  Created by Hadi Zamani on 4/25/16.
//  Copyright © 2016 SomeSimpleSolution. All rights reserved.
//

import Foundation
public struct PredicateObject: PredicateProtocol {
    var fieldName: String
    var operatorName: OperatorEnum
    var value: Any
    
   public init(fieldName: String,operatorName: OperatorEnum, value: Any){
        self.fieldName = fieldName
        self.operatorName = operatorName
        self.value = value
    }
    
   public func toNSPredicate() -> NSPredicate? {
        let predicateString = String(format: "%@ %@ %@", self.fieldName, self.operatorName.rawValue, "%@")
    return NSPredicate(format: predicateString, argumentArray: [self.value])
    }
}
