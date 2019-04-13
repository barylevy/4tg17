//
//  LocationGeocoder.swift
//  tg17_assignment
//
//  Created by Bary Levy on 14/04/2019.
//  Copyright © 2019 Bary Levy. All rights reserved.
//

import Foundation
//import MapKit
import NMAKit

enum LocationGeocoderError: Error {
    case typeError(String)
}

class LocationGeocoder: LocationGeocoding {

    func reverseGeocode(_ position: CLLocationCoordinate2D, completion:@escaping (String?, Error?)->()){

        NMAGeocoder.shared().makeReverseGeocodeRequest(geoCoordinates: position.toGeoCoordinatesMNA()).start
            { (request: NMARequest?, data: Any?, error: Error?) in

                guard error == nil else {
                    print("error \(error!.localizedDescription)")
                    return
                }

                guard (request is NMAReverseGeocodeRequest) else {
                    print("invalid type returned")
                    completion(nil, LocationGeocoderError.typeError("invalid type returned"))
                    return
                }

                guard let arr = data as? NSArray, arr.count > 0 else {
                    return
                }

                if let result = arr[0] as? NMAReverseGeocodeResult,
                    let address = result.location?.address.formattedAddress {
                    completion(address, nil)
                }
        }
    }
}
