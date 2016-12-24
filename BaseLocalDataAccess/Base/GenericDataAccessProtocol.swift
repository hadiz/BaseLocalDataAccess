//
//  DataAccessProtocol.swift
//  MemorizeItForever
//
//  Created by Hadi Zamani on 4/23/16.
//  Copyright © 2016 SomeSimpleSolution. All rights reserved.
//

import CoreData

public protocol GenericDataAccessProtocol {
    associatedtype T
    
    init(context: ManagedObjectContextProtocol)
    func createNewInstance() throws -> T
    func saveEntity(_ entity: T) throws
    func fetchEntity(predicate: PredicateProtocol?, sort: SortProtocol?, fetchLimit: Int?, fetchOffset: Int?) throws -> [T]
    func fetchEntityCount(predicate: PredicateProtocol?) throws -> Int
    func deleteEntity(_ entity: T) throws
}
