//
//  PredicateProtocol.swift
//  MemorizeItForever
//
//  Created by Hadi Zamani on 4/25/16.
//  Copyright © 2016 SomeSimpleSolution. All rights reserved.
//

import Foundation

public protocol PredicateProtocol {
    func toNSPredicate() -> NSPredicate?
}