//
//  CategoryData.swift
//  tg17_assignment
//
//  Created by Bary Levy on 09/04/2019.
//  Copyright © 2019 Bary Levy. All rights reserved.
//

import Foundation

class CategoryData {
    let uniqueId: String
    let name: String

    init(name: String, uniqueId: String) {
        self.name = name
        self.uniqueId = uniqueId
    }
}
