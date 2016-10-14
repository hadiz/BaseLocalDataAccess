//
//  SortProtocol.swift
//  MemorizeItForever
//
//  Created by Hadi Zamani on 5/1/16.
//  Copyright © 2016 SomeSimpleSolution. All rights reserved.
//
import Foundation

public protocol SortProtocol {
   func toNSSortDescriptor() -> [NSSortDescriptor]?
}