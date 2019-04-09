//
//  CategoryCell.swift
//  tg17_assignment
//
//  Created by Bary Levy on 08/04/2019.
//  Copyright © 2019 Bary Levy. All rights reserved.
//

import UIKit

@objc class CategoryCell: UITableViewCell {

    static let identifier = "CategoryCell"

    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categorySwitch: UISwitch!

    var stateChanged:((Int,Bool)->())?
    var index: Int = -1

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setData(_ name: String, state: Bool, index: Int) {
        self.categoryName.text = name
        self.categorySwitch.isOn = state
        self.index = index
    }
    @IBAction func switchChanged(_ sender: Any) {
        self.stateChanged?(self.index, self.categorySwitch.isOn)
    }
}
