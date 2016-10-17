//
//  SortObject.swift
//  MemorizeItForever
//
//  Created by Hadi Zamani on 5/1/16.
//  Copyright © 2016 SomeSimpleSolution. All rights reserved.
//

import Foundation

public struct SortObject: SortProtocol {
    var fieldName: String
    var direction: SortDirectionEnum
    
    public init(fieldName: String,direction: SortDirectionEnum){
        self.fieldName = fieldName
        self.direction = direction
    }
    
    public func toNSSortDescriptor() -> [NSSortDescriptor]? {
        return [NSSortDescriptor(key: self.fieldName, ascending: sortDirection())]
    }
    
    private func sortDirection() -> Bool{
        switch self.direction {
        case .ascending:
            return true
        case .descending:
            return false
        }
    }
}
