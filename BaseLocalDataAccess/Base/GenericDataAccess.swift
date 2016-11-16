//
//  GenericDataAccess.swift
//  MemorizeItForever
//
//  Created by Hadi Zamani on 4/20/16.
//  Copyright © 2016 SomeSimpleSolution. All rights reserved.
//

import UIKit
import CoreData

final public class GenericDataAccess<TEntity>: GenericDataAccessProtocol where TEntity: EntityProtocol, TEntity: AnyObject, TEntity: NSFetchRequestResult {
  
    public typealias T = TEntity
    
    private let context: ManagedObjectContextProtocol
    
    private var managedObjectContext: NSManagedObjectContext
    
    public init(context: ManagedObjectContextProtocol){
        self.context = context
        managedObjectContext = context.get()
    }
    
    public func createNewInstance() throws -> TEntity{
        let entityName = getName()
        
        if let entity = NSEntityDescription.insertNewObject(forEntityName: entityName, into: managedObjectContext) as? T{
            return entity
        }
        
        throw EntityCRUDError.failNewEntity(entityName)
    }
    
    public func saveEntity(_ entity: TEntity) throws{
        
        do{
            try managedObjectContext.save()
        }
        catch let error as NSError  {
            throw EntityCRUDError.failSaveEntity(error.localizedDescription)
        }
        
    }
    
    public func fetchEntity(predicate: PredicateProtocol? = nil, sort: SortProtocol? = nil, fetchLimit: Int? = nil) throws -> [TEntity]{
        
        let entityName = getName()
        
        let fetchRequest = NSFetchRequest<T>(entityName: entityName)
        
        fetchRequest.predicate = predicate?.toNSPredicate()
        
        fetchRequest.sortDescriptors = sort?.toNSSortDescriptor()
        
        if let fetchLimit = fetchLimit{
            fetchRequest.fetchLimit = fetchLimit
        }
        
        do{
            return try managedObjectContext.fetch(fetchRequest)
        }
        catch{
            throw EntityCRUDError.failFetchEntity(getName())
        }
        
    }
    
    public func fetchEntityCount(predicate: PredicateProtocol? = nil) throws -> Int{
        
        let entityName = getName()
        
        let fetchRequest = NSFetchRequest<T>(entityName: entityName)
        fetchRequest.predicate = predicate?.toNSPredicate()
        do{
            let count = try managedObjectContext.count(for: fetchRequest)
            return count
        }
        catch{
            throw EntityCRUDError.failFetchEntityCount(getName())
        }
    }
    
    public func deleteEntity(_ entity: TEntity) throws{
        
        if let entity = entity as? NSManagedObject{
            managedObjectContext.delete(entity)
            
            do{
                try managedObjectContext.save()
                
            }
            catch{
                throw EntityCRUDError.failDeleteEntity(self.getName())
            }
        }
    }
    
    private func getName() -> String{
        return T.entityName
    }
}
