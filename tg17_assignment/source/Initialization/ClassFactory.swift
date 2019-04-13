//
//  ClassFactory.swift
//  tg17_assignment
//
//  Created by Bary Levy on 13/04/2019.
//  Copyright © 2019 Bary Levy. All rights reserved.
//

import Foundation

enum ClassFactoryError: Error {
    case runtimeError(String)
}

class ClassFactory {

    static let factory = ClassFactory()

    class func getInstance() -> ClassFactory{
        return factory
    }
    var class_map = [String : Any]()

    func resolve<T>(type:T) throws -> Any
    {
        let name = String(describing: type.self)

        if let val:Any = class_map[name]{
            return val
        }
        throw ClassFactoryError.runtimeError("Impl Not Exist for: "+name)

    }
    func register( type:Any, impl:Any){
        let name = String(describing: type.self)

        class_map[name] = impl
    }
}
