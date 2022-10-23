//
//  UnitTemperatureExtensions.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 9/5/22.
//

import Foundation

public extension UnitTemperature {

    static func unit(from unitString: String) -> UnitTemperature {
        unitString.uppercased().contains("F") ? Self.fahrenheit : Self.celsius
    }

}

public extension UnitTemperature {

    static func temperatureString(value: Double, unit: UnitTemperature? = nil) -> String {
        let measurement = Measurement(value: value, unit: unit ?? Self.celsius)
        return Formatters.temperatureFormatter.string(from: measurement)
    }

}
