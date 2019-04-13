//
//  MapVC+NearBy.swift
//  tg17_assignment
//
//  Created by Bary Levy on 08/04/2019.
//  Copyright © 2019 Bary Levy. All rights reserved.
//

import Foundation
import MapKit

extension MapVC
{
    func searchPlace (coordinate: CLLocationCoordinate2D) {
        guard let pos = self.refPosition else { return }
        let list = self.categoriesList.includedCategories()
        guard  list.count > 0 else { return  }

        Helper.showIndicator(onView: self.view)

        let boundingBox = self.mapView.boundingBox()
        self.searchProvider?.searchPlaces (coordinate: pos, categoriesList: list, boundingBox: boundingBox, completion: {  placeDataArr, error in
            Helper.hideIndicator()
            guard error == nil else {
                self.showMessage(error.debugDescription)
                return
            }
            self.clearMessage()
            self.places = placeDataArr ?? []
        })
    }
}

