//
//  DateExtensions.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 9/3/22.
//

import Foundation

extension Date {

    public static var hourOfTheDayMessage: String {
        let hour = Calendar.current.component(.hour, from: Date())
        let hourText = hourOfTheDay(hour: hour)
        return "Good \(hourText)!"
    }

    private static func hourOfTheDay(hour: Int) -> String {
        switch hour {
            case 1...11: return "Morning"
            case 12...17: return "Afternoon"
            case 18...23: return "Evening"
            default: return ""
        }
    }

}
