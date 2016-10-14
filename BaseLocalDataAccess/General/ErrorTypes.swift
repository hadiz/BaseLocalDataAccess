//
//  ErrorTypes.swift
//  MemorizeItForever
//
//  Created by Hadi Zamani on 6/14/16.
//  Copyright © 2016 SomeSimpleSolution. All rights reserved.
//

public enum EntityCRUDError: Error {
    case failNewEntity(String)
    case failSaveEntity(String)
    case failEditEntity(String)
    case failFetchEntity(String)
    case failFetchEntityCount(String)
    case failDeleteEntity(String)
}
public enum ModelError: Error {
    case failCreateModel(String)
}

public enum DataAccessError: Error{
    case failSaveData(String)
    case failFetchData(String)
    case failEditData(String)
    case failDeleteData(String)
}
