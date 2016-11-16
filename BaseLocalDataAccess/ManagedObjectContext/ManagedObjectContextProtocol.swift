//
//  ManagedObjectContextProtocol.swift
//  MemorizeItForever
//
//  Created by Hadi Zamani on 4/30/16.
//  Copyright © 2016 SomeSimpleSolution. All rights reserved.
//

import CoreData

public protocol ManagedObjectContextProtocol {
    func get() -> NSManagedObjectContext
}
