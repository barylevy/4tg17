//
//  HereSearchProvider.swift
//  tg17_assignment
//
//  Created by Bary Levy on 13/04/2019.
//  Copyright © 2019 Bary Levy. All rights reserved.
//

import Foundation
import NMAKit

class HereSearchProvider: SearchProviding {

    init() {
        NMAApplicationContext.set(appId: here_credentials.appId, appCode: here_credentials.appCode)
    }
    func searchCategories(completion: @escaping CategoryListCompletion) {

        NMAPlaces.shared().refreshTopLevelCategories(completionBlock: { (categories: [NMACategory]?, error) in
             let placeCategory = categories?.map({  category -> CategoryData in
                return CategoryData(name: category.name, uniqueId: category.uniqueId )
            }) ?? []
            completion(placeCategory)
        })
    }

    func searchPlaces (coordinate: CLLocationCoordinate2D,
                               categoriesList: [CategoryData],
                               boundingBox: BoundingBox,
                               completion: @escaping ([PlaceData]?, Error?)->()) {

        let filter = NMACategoryFilter()
        for category in categoriesList {
            filter.add(fromUniqueId: category.uniqueId)
        }

        let searchRequest = NMAPlaces.shared().makeExploreRequest(location: coordinate.toGeoCoordinatesMNA(), geoArea: boundingBox.getNMAGeoBoundingBox(), filters: filter)

        if let error = searchRequest?.start(block: { (_ req: NMARequest, _ data: Any?, _ error: Error?) in

            guard error == nil else {
                completion(nil, error)
                return
            }
            guard data is NMADiscoveryPage, let resultPage = data as? NMADiscoveryPage else {
                completion(nil, NSError(domain: "invalid type returned \(String(describing: data))", code: 1, userInfo: nil))
                return
            }
            let places = resultPage.discoveryResults.filter({ (place) -> Bool in
                place is NMAPlaceLink
            }).map({ (link) -> PlaceData in
                let placeLink = link as! NMAPlaceLink
                return PlaceData(name: placeLink.name ?? "",
                                 categoryName: placeLink.category.name,
                                 position: placeLink.position.toGeoCoordinatesCLL())
            });
            completion(places, nil)

        }) as NSError? {
            completion(nil, error)
        }
    }
}
