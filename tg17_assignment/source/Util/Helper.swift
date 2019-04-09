//
//  Helper.swift
//  tg17_assignment
//
//  Created by Bary Levy on 08/04/2019.
//  Copyright © 2019 Bary Levy. All rights reserved.
//

import Foundation
import UIKit

class Helper {

    static var indicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .gray)

    static func showIndicator(onView view:UIView) {
        indicator.frame = CGRect(x: 0.0, y: 0.0, width: 70.0, height: 70.0)
        indicator.center = view.center
        view.addSubview(indicator)
        view.bringSubviewToFront(indicator)
        indicator.startAnimating()
    }

    static func hideIndicator() {
        indicator.stopAnimating()
    }


}
