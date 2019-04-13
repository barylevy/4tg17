//
//  SearchProvider.swift
//  tg17_assignment
//
//  Created by Bary Levy on 13/04/2019.
//  Copyright © 2019 Bary Levy. All rights reserved.
//

import Foundation
import MapKit

typealias CategoryListCompletion = (([CategoryData])->())
typealias SearchPlacesCompletion = ([PlaceData]?, Error?)->()

protocol SearchProviding {

    func searchCategories(completion: @escaping CategoryListCompletion) 

    func searchPlaces (coordinate: CLLocationCoordinate2D,
                               categoriesList: [CategoryData],
                               boundingBox: BoundingBox,
                               completion: @escaping SearchPlacesCompletion)

}
