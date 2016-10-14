//
//  EntityNameProtocol.swift
//  MemorizeItForever
//
//  Created by Hadi Zamani on 4/20/16.
//  Copyright © 2016 SomeSimpleSolution. All rights reserved.
//

public protocol EntityProtocol {
    associatedtype Fields: RawRepresentable
    static var idField: String{ get }
    static var entityName: String{ get }
    func toModel() throws -> ModelProtocol
}
