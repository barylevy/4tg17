//
//  CLLocationCoordinate2D+helper.swift
//  tg17_assignment
//
//  Created by Bary Levy on 08/04/2019.
//  Copyright © 2019 Bary Levy. All rights reserved.
//

import UIKit
import CoreLocation
import NMAKit
import MapKit

extension CLLocationCoordinate2D {

    func toGeoCoordinatesMNA() -> NMAGeoCoordinates {
        return NMAGeoCoordinates(latitude: self.latitude, longitude: self.longitude)
    }
}
extension NMAGeoCoordinates {
    func toGeoCoordinatesCLL() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
}
extension MKMapView {
    func boundingBox() -> NMAGeoBoundingBox {

        let tlPoint = CGPoint(x: bounds.origin.x , y: bounds.origin.y)
        let brPoint = CGPoint(x: (bounds.origin.x + bounds.size.width), y: bounds.origin.y + bounds.size.height)


        let tlCoord = self.convert(tlPoint, toCoordinateFrom: self)
        let brCoord = self.convert(brPoint, toCoordinateFrom: self)

        let box = NMAGeoBoundingBox(topLeft: tlCoord.toGeoCoordinatesMNA(), bottomRight: brCoord.toGeoCoordinatesMNA())
        return box
    }
}
