//
//  DataAccessProtocol.swift
//  MemorizeItForever
//
//  Created by Hadi Zamani on 4/23/16.
//  Copyright © 2016 SomeSimpleSolution. All rights reserved.
//

import CoreData

public protocol DataAccessProtocol {
    associatedtype T: EntityProtocol, AnyObject, NSFetchRequestResult
    var dataAccess : GenericDataAccess<T> {get}
    var context: ManagedObjectContextProtocol{get}
}
