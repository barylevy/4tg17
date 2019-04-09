//
//  MapVC+NearBy.swift
//  tg17_assignment
//
//  Created by Bary Levy on 08/04/2019.
//  Copyright © 2019 Bary Levy. All rights reserved.
//

import Foundation
import NMAKit

extension MapVC: NMAResultListener
{

    func initCategories() {
        NMAPlaces.shared().refreshTopLevelCategories(completionBlock: { (categories: [NMACategory]?, error) in
            self.categoriesList.placeCategory = categories ?? []
            if let pos = self.refPosition {
                self.triggerSearchRequest(coordinate: pos)
            }
        })
    }
    func triggerHereRequest(coordinate: CLLocationCoordinate2D) {
        Helper.showIndicator(onView: self.view)

        let filter = NMACategoryFilter()
        let hereRequest = NMAPlaces.shared().makeHereRequest(location: coordinate.toGeoCoordinatesMNA(), filters: filter)
        if let error = hereRequest?.start(listener: self) as NSError? {
            self.showMessage("Error:here request fired with error code \(error.code)")
            Helper.hideIndicator()
        }
    }
    func triggerSearchRequest (coordinate: CLLocationCoordinate2D)
    {
        guard let pos = self.refPosition else { return }
        let list = self.categoriesList.includedCategories()
        guard  list.count > 0 else { return  }

        let filter = NMACategoryFilter()
        for uniqueId in list {
            filter.add(fromUniqueId: uniqueId)
        }
        Helper.showIndicator(onView: self.view)
        let searchRequest = NMAPlaces.shared().makeExploreRequest(location: pos.toGeoCoordinatesMNA(), geoArea: self.mapView.boundingBox(), filters: filter)
        if let error = searchRequest?.start(listener: self) as NSError? {
            self.showMessage("Error:search request fired with error code \(error.code)")
            Helper.hideIndicator()
        }
    }
    func requestDidComplete(_ request: NMARequest, data: Any?, error: Error?) {

        guard error == nil else {
            print("discovery request error \(error?.localizedDescription ?? "")")
            return
        }
        guard data is NMADiscoveryPage, let resultPage = data as? NMADiscoveryPage else {
            print ("invalid type returned \(String(describing: data))")
            self.showMessage("invalid type returned \(String(describing: data))")
            return
        }

        Helper.hideIndicator()

        self.resultsArray = resultPage.discoveryResults;
        self.clearMessage()
    }
}

