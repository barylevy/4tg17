//
//  MapVC+Geocoder.swift
//  tg17_assignment
//
//  Created by Bary Levy on 08/04/2019.
//  Copyright © 2019 Bary Levy. All rights reserved.
//

import Foundation
import NMAKit

extension MapVC {
    
    func reverseGeocode(_ position: CLLocationCoordinate2D){

        self.title = "calculating..."

        self.geocoderProvider?.reverseGeocode(position, completion: { [weak self] (address, error) in
            guard let self = self else {
                return
            }
            guard error == nil else{
                self.showMessage( error.debugDescription)
                return
            }
            self.title = address
        })

    }
}
