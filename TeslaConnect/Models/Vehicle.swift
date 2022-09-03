//
//  Vehicle.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 9/3/22.
//

import Foundation

struct Vehicle: Codable {
    let id: Int
    let vehicleID: Int
    let vin: String
    let displayName: String
    let optionCodes: [String]
    let color: String?
    let tokens: [String]
    let state: String
    let inService: Bool
    let idString: String
    let calendarEnabled: Bool
    let apiVersion: Int

    init(
        id: Int,
        vehicleID: Int,
        vin: String,
        displayName: String,
        optionCodes: [String],
        color: String?,
        tokens: [String],
        state: String,
        inService: Bool,
        idString: String,
        calendarEnabled: Bool,
        apiVersion: Int
    ) {
        self.id = id
        self.vehicleID = vehicleID
        self.vin = vin
        self.displayName = displayName
        self.optionCodes = optionCodes
        self.color = color
        self.tokens = tokens
        self.state = state
        self.inService = inService
        self.idString = idString
        self.calendarEnabled = calendarEnabled
        self.apiVersion = apiVersion
    }

    enum CodingKeys: String, CodingKey {
        case id
        case vehicleID = "vehicle_id"
        case vin
        case displayName = "display_name"
        case optionCodes = "option_codes"
        case color, tokens, state
        case inService = "in_service"
        case idString = "id_s"
        case calendarEnabled = "calendar_enabled"
        case apiVersion = "api_version"
    }
}
