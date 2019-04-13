//
//  BoundingBox.swift
//  tg17_assignment
//
//  Created by Bary Levy on 14/04/2019.
//  Copyright © 2019 Bary Levy. All rights reserved.
//

import Foundation
import MapKit

struct BoundingBox {
    let tlCoord: CLLocationCoordinate2D
    let brCoord: CLLocationCoordinate2D

    init( topLeft: CLLocationCoordinate2D, bottomRight: CLLocationCoordinate2D) {
        self.tlCoord = topLeft
        self.brCoord = bottomRight
    }
}
