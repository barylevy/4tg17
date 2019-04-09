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

        NMAGeocoder.shared().makeReverseGeocodeRequest(geoCoordinates: position.toGeoCoordinatesMNA()).start
            { [weak self] (request: NMARequest?, data: Any?, error: Error?) in
            guard let self = self else {
                return
            }

            guard error == nil else {
                print("error \(error!.localizedDescription)")
                return
            }

            guard (request is NMAReverseGeocodeRequest) else {
                print("invalid type returned")
                self.showMessage( "error invalid type returned")
                return
            }

            guard let arr = data as? NSArray, arr.count > 0 else {
                return
            }

            if let result = arr[0] as? NMAReverseGeocodeResult,
                let address = result.location?.address.formattedAddress {
                self.title = address
            }
        }
    }
}
