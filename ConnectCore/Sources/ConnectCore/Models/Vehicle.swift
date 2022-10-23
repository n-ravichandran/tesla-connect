//
//  Vehicle.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 9/3/22.
//

import Foundation

public struct Vehicle: Codable {
    public let id: Int
    public let vehicleID: Int
    public let vin: String
    public let displayName: String
//    public let optionCodes: String
//    public let color: String?
//    public let tokens: [String]
//    public let state: String
//    public let inService: Bool
//    public let idString: String
//    public let calendarEnabled: Bool
//    public let apiVersion: Int

    init(
        id: Int,
        vehicleID: Int,
        vin: String,
        displayName: String
//        optionCodes: String,
//        color: String?,
//        tokens: [String],
//        state: String,
//        inService: Bool,
//        idString: String,
//        calendarEnabled: Bool,
//        apiVersion: Int
    ) {
        self.id = id
        self.vehicleID = vehicleID
        self.vin = vin
        self.displayName = displayName
//        self.optionCodes = optionCodes
//        self.color = color
//        self.tokens = tokens
//        self.state = state
//        self.inService = inService
//        self.idString = idString
//        self.calendarEnabled = calendarEnabled
//        self.apiVersion = apiVersion
    }

    enum CodingKeys: String, CodingKey {
        case id
        case vehicleID = "vehicle_id"
        case vin
        case displayName = "display_name"
//        case optionCodes = "option_codes"
//        case color, tokens, state
//        case inService = "in_service"
//        case idString = "id_s"
//        case calendarEnabled = "calendar_enabled"
//        case apiVersion = "api_version"
    }
}

public enum VehicleModel: String, Sendable {
    case modelS = "models"
    case model3 = "model3"
    case modelX = "modelx"
    case modelY = "modely"

    public init(value: String) {
        switch value {
            case Self.modelS.rawValue:
                self = .modelS
            case Self.model3.rawValue:
                self = .model3
            case Self.modelX.rawValue:
                self = .modelX
            default:
                self = .modelY
        }
    }
}
