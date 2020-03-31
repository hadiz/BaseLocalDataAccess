# BaseLocalDataAccessPackage

BaseLocalDataAccessPackage is a wrapper around Core Data that allows writing code to fetch and manipulate data simpler.

## Usage

Adopt the Entities to `EntityProtocol`. 

```swift
import CoreData
import BaseLocalDataAccess

class SetEntity: NSManagedObject, EntityProtocol {
    
    public static var entityName: String{
        return [Entity name]
    }
    
    public static var idField: String{
        return Fields.Id.rawValue
    }
    
    public func toModel() throws -> ModelProtocol {
        guard let id = self.id else{
            throw ModelError.failCreateModel(Models.setModel.rawValue)
        }
        var setModel = SetModel()
        setModel.setId = UUID(uuidString: id)
        setModel.name = self.name
        return setModel
    }
    
    public enum Fields: String {
        case Id = "id"
        case Name = "name"
    }
}
```

Impelement the `ManagedObjectContextProtocol`.

```swift
import CoreData
import BaseLocalDataAccess

final class BaseManagedObjectContext: ManagedObjectContextProtocol {
   
    lazy var managedObjectContext: NSManagedObjectContext = {
        return ContextHelper.shared.getContext()
    }()
    
    public init(){
    }
}
```
```swift
import CoreData

public final class ContextHelper {
    public static let shared = ContextHelper()
    
    private var context: NSManagedObjectContext?
    
    private init(){
    }
    
    public func setContext(context: NSManagedObjectContext){
        self.context = context
    }
    
    public func getContext() -> NSManagedObjectContext{
        guard let context = context else {
            fatalError("context is nil")
        }
        return context
    }
}
```

Set the context in the `AppDelegate`.

Now it’s time to use the library to fetch, save, edit, and delete.
Prepare the data access class.

```swift 
import BaseLocalDataAccess

class SetDataAccess: SetDataAccessProtocol  {
    
    private var genericDataAccess: GenericDataAccess<SetEntity>!
    
    init(genericDataAccess: GenericDataAccess<SetEntity>) {
        self.genericDataAccess = genericDataAccess
    }
    
    /// ...
 }
```

To save:

```swift
 func save(_ setModel: SetModel) throws{
        do{
            let setEntity = try genericDataAccess.createNewInstance()
            setEntity.id = genericDataAccess.generateId()
            setEntity.name = setModel.name
            
            try genericDataAccess.saveEntity()
        }
        catch{
            throw EntityCRUDError.failSaveEntity(genericDataAccess.getEntityName())
        }
    }
```

to fetch:

```swift
func fetchAll() throws -> [SetModel] {
        do{
            return try genericDataAccess.fetchModels(predicate: nil, sort: nil)
        }
        catch let error as NSError{
            throw  DataAccessError.failFetchData(error.localizedDescription)
        }
    }
```
It is possible to sort the fetching data:

```swift
  let sort = SortObject(fieldName: [field mame], direction: .ascending )
```

Also filtering data:

```swift
  let predicateObject = PredicateObject(fieldName: [field mame, e.g. Id], operatorName: .equal, value: [value])
```

It is also possible to have compound predicates:

```swift
  let predicateObject1 = PredicateObject(fieldName: [field mame], operatorName: .equal, value: [value])
  let predicateObject2 = PredicateObject(fieldName:[field mame], operatorName: .equal, value: [value])
  var predicateCompound = PredicateCompoundObject(compoundOperator: .and)
  predicateCompound.appendPredicate(predicateObject1)
  predicateCompound.appendPredicate(predicateObject2)
```
