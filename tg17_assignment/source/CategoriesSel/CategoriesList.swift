//
//  CategoriesList.swift
//  tg17_assignment
//
//  Created by Bary Levy on 08/04/2019.
//  Copyright © 2019 Bary Levy. All rights reserved.
//

import Foundation
import NMAKit

class CategoriesList {
    var states = [String: Bool]()
    var placeCategory = [NMACategory]()

    func rebuild()  {
        for uid in placeCategory {
            self.states[uid.uniqueId] = self.states[uid.uniqueId] ?? true
        }
    }
    func includedCategories() -> [String]  {
//        let filter = [MNAC]()
        let list = self.placeCategory.filter { (category) -> Bool in
            self.states[category.uniqueId] ?? true
            }.map({$0.uniqueId})

        return list
    }
}
