//
//  VehicleConfig.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 9/3/22.
//

import Foundation

public struct VehicleConfig: Codable {
    public let canAcceptNavigationRequests, canActuateTrunks: Bool
    public let carSpecialType, carType, chargePortType: String
    public let eceRestrictions, euVehicle: Bool
    public let exteriorColor: String
    public let hasAirSuspension, hasLudicrousMode, motorizedChargePort, plg: Bool
    public let rearSeatHeaters, rearSeatType: Int
    public let rhd: Bool
    public let roofColor: String
    public let seatType: Int?
    public let spoilerType: String
    public let sunRoofInstalled: Int?
    public let thirdRowSeats: String
    public let timestamp: Int
    public let trimBadging: String
    public let useRangeBadging: Bool
    public let wheelType: String

    enum CodingKeys: String, CodingKey {
        case canAcceptNavigationRequests = "can_accept_navigation_requests"
        case canActuateTrunks = "can_actuate_trunks"
        case carSpecialType = "car_special_type"
        case carType = "car_type"
        case chargePortType = "charge_port_type"
        case eceRestrictions = "ece_restrictions"
        case euVehicle = "eu_vehicle"
        case exteriorColor = "exterior_color"
        case hasAirSuspension = "has_air_suspension"
        case hasLudicrousMode = "has_ludicrous_mode"
        case motorizedChargePort = "motorized_charge_port"
        case plg
        case rearSeatHeaters = "rear_seat_heaters"
        case rearSeatType = "rear_seat_type"
        case rhd
        case roofColor = "roof_color"
        case seatType = "seat_type"
        case spoilerType = "spoiler_type"
        case sunRoofInstalled = "sun_roof_installed"
        case thirdRowSeats = "third_row_seats"
        case timestamp
        case trimBadging = "trim_badging"
        case useRangeBadging = "use_range_badging"
        case wheelType = "wheel_type"
    }
}
