//
//  ArrayExtensions.swift
//  MemorizeItForever
//
//  Created by Hadi Zamani on 4/24/16.
//  Copyright © 2016 SomeSimpleSolution. All rights reserved.
//

import Foundation

extension Array where Element: EntityProtocol{
    
    public func toModels<TModel: ModelProtocol>() throws -> [TModel]{
        do{
            var models: [ModelProtocol] = []
            for item in self{
                let model = try item.toModel()
                models.append(model)
            }
            return models.compactMap{$0 as? TModel}
        }
        catch let error as NSError{
            throw ModelError.failCreateModel(error.localizedDescription)
        }
    }
}
