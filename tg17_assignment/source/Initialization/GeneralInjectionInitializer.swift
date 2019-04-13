//
//  GeneralInjectionInitializer.swift
//  tg17_assignment
//
//  Created by Bary Levy on 13/04/2019.
//  Copyright © 2019 Bary Levy. All rights reserved.
//

import Foundation

class GeneralInjectionInitializer: NSObject {

    class func initFactoryGeneral( classFactory: ClassFactory) {

        classFactory.register(type: SearchProviding.self, impl: HereSearchProvider())

    }
}
