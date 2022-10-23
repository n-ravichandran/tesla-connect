//
//  UnitLengthExtensions.swift
//  
//
//  Created by Niranjan Ravichandran on 10/23/22.
//

import Foundation

public extension UnitLength {
    static func unit(from unitString: String) -> UnitLength {
        unitString.lowercased().contains("mi/hr") ? Self.miles : Self.kilometers
    }
}


public extension UnitLength {
    static func rangeString(value: Double) -> String {
        let measurement = Measurement(value: value, unit: Self.miles)
        return Formatters.distanceFormatter.string(from: measurement)
    }
}

