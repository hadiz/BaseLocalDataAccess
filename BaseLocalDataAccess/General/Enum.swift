//
//  Enum.swift
//  MemorizeItForever
//
//  Created by Hadi Zamani on 6/14/16.
//  Copyright © 2016 SomeSimpleSolution. All rights reserved.
//

public enum SortDirectionEnum {
    case ascending
    case descending
}
public enum OperatorEnum: String{
    case equal = "=="
    case notEqual = "!="
    case greaterThan = ">"
    case greaterEqualThan = ">="
    case lessThan = "<"
    case lessEqualThan = "<="
    case contains = "CONTAINS[cd]"
}
public enum CompoundOperatorEnum {
    case and
    case or
}
