//
//  MapVC+MapObjects.swift
//  tg17_assignment
//
//  Created by Bary Levy on 08/04/2019.
//  Copyright © 2019 Bary Levy. All rights reserved.
//

import Foundation
import MapKit

extension MapVC: MKMapViewDelegate {

    func addMarkerAtPlace(_ place: PlaceData) -> Void {
        let annotation = MKPointAnnotation()
        annotation.title = place.name
        annotation.subtitle = place.categoryName
        annotation.coordinate = place.position
        self.mapView.addAnnotation(annotation)
        self.mapObjectsArray.append(annotation)
    }
    func cleanMap () {
        if !self.mapObjectsArray.isEmpty {
            self.mapView.removeAnnotations(self.mapObjectsArray)
            self.mapObjectsArray.removeAll()
        }
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }

        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if let annotationV = annotationView {
            annotationV.annotation = annotation
            return annotationV
        }
        let annotationV = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        annotationV.canShowCallout = true
        annotationView = annotationV

        return annotationView
    }
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        self.refPosition = self.mapView.centerCoordinate
    }
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        self.cleanMap()
        self.clearMessage()
    }
    func reloadMapObjects()  {
        cleanMap()

        for place in self.places {
            self.addMarkerAtPlace(place);
        }
    }
}
