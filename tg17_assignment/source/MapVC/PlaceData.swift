//
//  PlaceData.swift
//  tg17_assignment
//
//  Created by Bary Levy on 08/04/2019.
//  Copyright © 2019 Bary Levy. All rights reserved.
//

import Foundation
import MapKit

class PlaceData {
    let name: String
    let categoryName: String
    let position: CLLocationCoordinate2D

    init(name:String, categoryName: String, position: CLLocationCoordinate2D) {
        self.name = name
        self.categoryName = categoryName
        self.position = position
    }
}
