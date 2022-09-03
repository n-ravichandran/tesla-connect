//
//  VehicleConfig.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 9/3/22.
//

import Foundation

struct VehicleConfig: Codable {
    let canAcceptNavigationRequests, canActuateTrunks: Bool
    let carSpecialType, carType, chargePortType: String
    let eceRestrictions, euVehicle: Bool
    let exteriorColor: String
    let hasAirSuspension, hasLudicrousMode, motorizedChargePort, plg: Bool
    let rearSeatHeaters, rearSeatType: Int
    let rhd: Bool
    let roofColor: String
    let seatType: Int
    let spoilerType: String
    let sunRoofInstalled: Int
    let thirdRowSeats: String
    let timestamp: Int
    let trimBadging: String
    let useRangeBadging: Bool
    let wheelType: String

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
