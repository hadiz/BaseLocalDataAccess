//
//  DataAccessProtocolExtensions.swift
//  MemorizeItForever
//
//  Created by Hadi Zamani on 4/24/16.
//  Copyright © 2016 SomeSimpleSolution. All rights reserved.
//

import Foundation

extension DataAccessProtocol{
    
    public func generateId() -> String{
        return UUID().uuidString
    }
    
    public func fetchEntities(predicate predicateProtocol: PredicateProtocol?, sort sortProtocol: SortProtocol?, fetchLimit: Int? = nil) throws -> [T]{
        do{
            return try dataAccess.fetchEntity(predicate: predicateProtocol, sort: sortProtocol, fetchLimit: fetchLimit)
        }
        catch{
            throw EntityCRUDError.failFetchEntity(T.entityName)
        }
    }
    
    public func fetchEntity(withId id: UUID) throws -> T? {
        var predicateProtocol: PredicateProtocol
        predicateProtocol = PredicateObject(fieldName: T.idField, operatorName: OperatorEnum.equal, value: id.uuidString as NSObject)
        do{
            let entities = try fetchEntities(predicate: predicateProtocol, sort: nil)
            if entities.count > 1 {
                throw DataAccessError.failFetchData("Mulitiple items returned")
            }
            else if entities.count == 1{
                return entities[0]
            }
            else{
                return nil
            }
        }
        catch{
            throw EntityCRUDError.failFetchEntity(T.entityName)
        }
    }
    
    public func fetchModels<TModel: ModelProtocol>(predicate predicateProtocol: PredicateProtocol?, sort sortProtocol: SortProtocol?, fetchLimit: Int? = nil) throws -> [TModel] {
        do{
            let entities = try fetchEntities(predicate: predicateProtocol, sort: sortProtocol,fetchLimit: fetchLimit)
            return try entities.toModels()
        }
        catch ModelError.failCreateModel(let model){
            throw ModelError.failCreateModel(model)
        }
        catch let error as NSError{
            throw  DataAccessError.failFetchData(error.localizedDescription)
        }
    }
    
    public func getEntityName() -> String{
        return T.entityName
    }
}
