//
//  MapVC+Actions.swift
//  tg17_assignment
//
//  Created by Bary Levy on 08/04/2019.
//  Copyright © 2019 Bary Levy. All rights reserved.
//

import UIKit

extension UIStoryboardSegue{
    static let showCategoryFilter = "showCategoryFilter"
}
extension MapVC {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == UIStoryboardSegue.showCategoryFilter {
            if let vc: CategorySelectionVC = segue.destination as? CategorySelectionVC {
                vc.viewModel.categoriesList = self.categoriesList
                vc.completion = {  list in
                    self.categoriesList = list
                }
            }
        }
    }
}
