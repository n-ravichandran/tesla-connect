//
//  Formatter.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 9/5/22.
//

import Foundation

public enum Formatters {

    public static let minSecDateFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .abbreviated
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()

    public static let noFractionDigitsFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 0
        numberFormatter.roundingMode = .halfUp
        return numberFormatter
    }()

    public static let temperatureFormatter: MeasurementFormatter = {
        let measurementFormatter = MeasurementFormatter()
        measurementFormatter.unitStyle = .short
        measurementFormatter.numberFormatter = noFractionDigitsFormatter
        return measurementFormatter
    }()

    public static let distanceFormatter: MeasurementFormatter = {
        let measurementFormatter = MeasurementFormatter()
        measurementFormatter.unitStyle = .long
        measurementFormatter.numberFormatter = noFractionDigitsFormatter
        return measurementFormatter
    }()

}
