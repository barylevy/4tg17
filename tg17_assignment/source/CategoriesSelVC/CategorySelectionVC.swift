//
//  CategorySelectionVC.swift
//  tg17_assignment
//
//  Created by Bary Levy on 08/04/2019.
//  Copyright © 2019 Bary Levy. All rights reserved.
//

import UIKit

class CategorySelectionVC: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var viewModel: CategoryViewModel = CategoryViewModel()

    var completion:((CategoriesList)->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
    }

    @IBAction func allCategoriesSwitch(_ sender: UISwitch) {
        self.viewModel.selectAllCategories(sender.isOn)
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numOfItems()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell: CategoryCell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.identifier) as? CategoryCell {
            let name = self.viewModel.getName(indexPath)
            let state = self.viewModel.getState(indexPath)
            cell.setData(name, state: state, index: indexPath.row)
            cell.stateChanged = self.viewModel.switchStateChanged
            return cell
        }

        return UITableViewCell()

    }
    override func viewWillDisappear(_ animated: Bool) {
        completion?(self.viewModel.categoriesList)
    }
}
