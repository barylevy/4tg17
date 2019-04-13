//
//  CLLocationCoordinate2D+helper.swift
//  tg17_assignment
//
//  Created by Bary Levy on 08/04/2019.
//  Copyright © 2019 Bary Levy. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

extension MKMapView {
    func boundingBox() -> BoundingBox {

        let tlPoint = CGPoint(x: bounds.origin.x , y: bounds.origin.y)
        let brPoint = CGPoint(x: (bounds.origin.x + bounds.size.width), y: bounds.origin.y + bounds.size.height)


        let tlCoord = self.convert(tlPoint, toCoordinateFrom: self)
        let brCoord = self.convert(brPoint, toCoordinateFrom: self)

        let box = BoundingBox(topLeft: tlCoord, bottomRight: brCoord)
        return box
    }
}
