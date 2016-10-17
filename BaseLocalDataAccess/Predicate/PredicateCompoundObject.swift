//
//  PredicateCompoundObject.swift
//  MemorizeItForever
//
//  Created by Hadi Zamani on 4/25/16.
//  Copyright © 2016 SomeSimpleSolution. All rights reserved.
//

import Foundation
public struct PredicateCompoundObject: PredicateProtocol {
    
    private var predicateObjects: [PredicateObject]
    private var compoundOperator: CompoundOperatorEnum
    
    public init(compoundOperator: CompoundOperatorEnum){
        
        self.compoundOperator = compoundOperator
        predicateObjects = []
    }
    
    mutating public func appendPredicate(_ predicateObject: PredicateObject){
        predicateObjects.append(predicateObject)
    }
    
    public func toNSPredicate() -> NSPredicate?{
        guard predicateObjects.count > 0 else{
            return nil
        }
        
        if predicateObjects.count == 1{
            return predicateObjects[0].toNSPredicate()
        }
        else{
            var nsPredicate: [NSPredicate] = []
            for item in predicateObjects{
                if let predicate = item.toNSPredicate(){
                    nsPredicate.append(predicate)
                }
            }
            let compoundPredicateType = getNSCompoundPredicateType(compoundOperator)
            return NSCompoundPredicate(type: compoundPredicateType, subpredicates: nsPredicate)
        }
    }
    
    private func getNSCompoundPredicateType(_ compoundOperator: CompoundOperatorEnum) -> NSCompoundPredicate.LogicalType{
        switch compoundOperator {
        case .and:
            return NSCompoundPredicate.LogicalType.and
        case .or:
            return NSCompoundPredicate.LogicalType.or
        }
        
    }
}
