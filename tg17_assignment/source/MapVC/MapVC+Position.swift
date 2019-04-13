//
//  MapVC+Position.swift
//  tg17_assignment
//
//  Created by Bary Levy on 08/04/2019.
//  Copyright © 2019 Bary Levy. All rights reserved.
//

import UIKit
import MapKit
import NMAKit

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

extension MapVC {
    func startPositioning() {
        NMAPositioningManager.shared().startPositioning()
        NotificationCenter.default.addObserver(self, selector: #selector(MapVC.positionDidUpdate), name: NSNotification.Name.NMAPositioningManagerDidUpdatePosition, object: NMAPositioningManager.shared())
        NotificationCenter.default.addObserver(self, selector: #selector(MapVC.didLosePosition), name: NSNotification.Name.NMAPositioningManagerDidLosePosition, object: NMAPositioningManager.shared())
    }
    func stopPositioning() {
        NMAPositioningManager.shared().stopPositioning()
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.NMAPositioningManagerDidUpdatePosition, object: NMAPositioningManager.shared())
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.NMAPositioningManagerDidLosePosition, object: NMAPositioningManager.shared())
    }

    @objc func positionDidUpdate() {
        if let position = NMAPositioningManager.shared().currentPosition {
            self.centerMapToPosition(position)
        }
    }
    func centerMapToPosition(_ position: NMAGeoPosition) {
        let coord = CLLocationCoordinate2D(latitude: position.coordinates.latitude, longitude: position.coordinates.longitude)
        self.mapView.setCenter(coord, animated: true)

        var mapRegion = MKCoordinateRegion()
        mapRegion.center = mapView.userLocation.coordinate
        mapRegion.span.latitudeDelta = CLLocationDegrees(0.15)
        mapRegion.span.longitudeDelta = CLLocationDegrees(0.15)
        
        self.mapView.setRegion(mapRegion, animated: true)
        self.reverseGeocode(coord)
    }

    @objc func didLosePosition() {
    }
    
}
