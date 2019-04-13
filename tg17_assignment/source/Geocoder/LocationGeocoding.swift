//
//  LocationGeocoding.swift
//  tg17_assignment
//
//  Created by Bary Levy on 14/04/2019.
//  Copyright © 2019 Bary Levy. All rights reserved.
//

import Foundation
import MapKit

protocol LocationGeocoding {

    func reverseGeocode(_ position: CLLocationCoordinate2D, completion:@escaping (String?, Error?)->())

}
