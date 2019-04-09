//
//  CategoryViewModel.swift
//  tg17_assignment
//
//  Created by Bary Levy on 08/04/2019.
//  Copyright © 2019 Bary Levy. All rights reserved.
//

import UIKit
import NMAKit

class CategoryViewModel: NSObject {

    var categoriesList = CategoriesList() {
        didSet{
            categoriesList.rebuild()
        }
    }

    func numOfItems() -> Int {
        return self.categoriesList.placeCategory.count
    }
    func getName(_ indexPath:IndexPath) -> String {
        return  self.categoriesList.placeCategory[indexPath.row].name
    }
    func getState(_ indexPath:IndexPath) -> Bool {
        return self.categoriesList.states[self.categoriesList.placeCategory[indexPath.row].uniqueId] ?? true
    }
    func switchStateChanged(index: Int, state:Bool)  {
        self.categoriesList.states[self.categoriesList.placeCategory[index].uniqueId] = state
    }
    func selectAllCategories(_ state: Bool) {
        for category in categoriesList.states.keys {
            categoriesList.states[category] = state
        }
    }
}
