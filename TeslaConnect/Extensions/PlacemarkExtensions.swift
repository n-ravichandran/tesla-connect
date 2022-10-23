//
//  PlacemarkExtensions.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 9/6/22.
//

import CoreLocation

extension CLPlacemark {

    var compactAddress: String? {
        guard let name = name else { return nil }

        var result = name

        if let street = thoroughfare, !result.contains(street) {
            result += ", \(street)"
        }

        if let city = locality {
            result += ", \(city)"
        }

        return result
    }

}
