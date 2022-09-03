//
//  VehicleData.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 9/3/22.
//

import Foundation

struct VehicleData: Codable {
    let id: Int
    let userID, vehicleID: Int
    let vin, displayName, optionCodes: String
//    let color: String? // Todo: Confirm type
    let accessType: String
    let tokens: [String]
    let state: String
    let inService: Bool
    let idString: String
    let calendarEnabled: Bool
    let apiVersion: Int
    let backseatToken, backseatTokenUpdatedAt: String? // Todo: Confirm type
    let driveState: DriveState
    let climateState: ClimateState
    let chargeState: ChargeState
    let guiSettings: GUISettings
    let vehicleState: VehicleState
    let vehicleConfig: VehicleConfig

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case vehicleID = "vehicle_id"
        case vin
        case displayName = "display_name"
        case optionCodes = "option_codes"
//        case color
        case accessType = "access_type"
        case tokens, state
        case inService = "in_service"
        case idString = "id_s"
        case calendarEnabled = "calendar_enabled"
        case apiVersion = "api_version"
        case backseatToken = "backseat_token"
        case backseatTokenUpdatedAt = "backseat_token_updated_at"
        case driveState = "drive_state"
        case climateState = "climate_state"
        case chargeState = "charge_state"
        case guiSettings = "gui_settings"
        case vehicleState = "vehicle_state"
        case vehicleConfig = "vehicle_config"
    }
}

// MARK: - ChargeState
struct ChargeState: Codable {
    let batteryHeaterOn: Bool
    let batteryLevel: Int
    let batteryRange: Double
    let chargeCurrentRequest, chargeCurrentRequestMax: Int
    let chargeEnableRequest: Bool
    let chargeEnergyAdded: Double
    let chargeLimitSoc, chargeLimitSocMax, chargeLimitSocMin, chargeLimitSocStd: Int
    let chargeMilesAddedIdeal, chargeMilesAddedRated: Int
    let chargePortColdWeatherMode: String? // Todo: Confirm type
    let chargePortDoorOpen: Bool
    let chargePortLatch: String
    let chargeRate: Int
    let chargeToMaxRange: Bool
    let chargerActualCurrent, chargerPhases, chargerPilotCurrent, chargerPower: Int
    let chargerVoltage: Int
    let chargingState, connChargeCable: String
    let estBatteryRange: Double
    let fastChargerBrand: String
    let fastChargerPresent: Bool
    let fastChargerType: String
    let idealBatteryRange: Double
    let managedChargingActive: Bool
    let managedChargingStartTime: Date? // Todo: Confirm type
    let managedChargingUserCanceled: Bool
    let maxRangeChargeCounter, minutesToFullCharge: Int
    let notEnoughPowerToHeat, scheduledChargingPending: Bool
    let scheduledChargingStartTime: Date? // Todo: Confirm type
    let timeToFullCharge: Double
    let timestamp: Int
    let tripCharging: Bool
    let usableBatteryLevel: Int
    let userChargeEnableRequest: String? // Todo: Confirm type

    enum CodingKeys: String, CodingKey {
        case batteryHeaterOn = "battery_heater_on"
        case batteryLevel = "battery_level"
        case batteryRange = "battery_range"
        case chargeCurrentRequest = "charge_current_request"
        case chargeCurrentRequestMax = "charge_current_request_max"
        case chargeEnableRequest = "charge_enable_request"
        case chargeEnergyAdded = "charge_energy_added"
        case chargeLimitSoc = "charge_limit_soc"
        case chargeLimitSocMax = "charge_limit_soc_max"
        case chargeLimitSocMin = "charge_limit_soc_min"
        case chargeLimitSocStd = "charge_limit_soc_std"
        case chargeMilesAddedIdeal = "charge_miles_added_ideal"
        case chargeMilesAddedRated = "charge_miles_added_rated"
        case chargePortColdWeatherMode = "charge_port_cold_weather_mode"
        case chargePortDoorOpen = "charge_port_door_open"
        case chargePortLatch = "charge_port_latch"
        case chargeRate = "charge_rate"
        case chargeToMaxRange = "charge_to_max_range"
        case chargerActualCurrent = "charger_actual_current"
        case chargerPhases = "charger_phases"
        case chargerPilotCurrent = "charger_pilot_current"
        case chargerPower = "charger_power"
        case chargerVoltage = "charger_voltage"
        case chargingState = "charging_state"
        case connChargeCable = "conn_charge_cable"
        case estBatteryRange = "est_battery_range"
        case fastChargerBrand = "fast_charger_brand"
        case fastChargerPresent = "fast_charger_present"
        case fastChargerType = "fast_charger_type"
        case idealBatteryRange = "ideal_battery_range"
        case managedChargingActive = "managed_charging_active"
        case managedChargingStartTime = "managed_charging_start_time"
        case managedChargingUserCanceled = "managed_charging_user_canceled"
        case maxRangeChargeCounter = "max_range_charge_counter"
        case minutesToFullCharge = "minutes_to_full_charge"
        case notEnoughPowerToHeat = "not_enough_power_to_heat"
        case scheduledChargingPending = "scheduled_charging_pending"
        case scheduledChargingStartTime = "scheduled_charging_start_time"
        case timeToFullCharge = "time_to_full_charge"
        case timestamp
        case tripCharging = "trip_charging"
        case usableBatteryLevel = "usable_battery_level"
        case userChargeEnableRequest = "user_charge_enable_request"
    }
}

// MARK: - ClimateState
struct ClimateState: Codable {
    let batteryHeater, batteryHeaterNoPower: Bool
    let climateKeeperMode: String
    let defrostMode: Int
    let driverTempSetting: Double
    let fanStatus: Int
    let insideTemp: Double
    let isAutoConditioningOn, isClimateOn, isFrontDefrosterOn, isPreconditioning: Bool
    let isRearDefrosterOn: Bool
    let leftTempDirection, maxAvailTemp, minAvailTemp, outsideTemp: Int
    let passengerTempSetting: Double
    let remoteHeaterControlEnabled: Bool
    let rightTempDirection, seatHeaterLeft, seatHeaterRight: Int
    let sideMirrorHeaters: Bool
    let timestamp: Int
    let wiperBladeHeater: Bool

    enum CodingKeys: String, CodingKey {
        case batteryHeater = "battery_heater"
        case batteryHeaterNoPower = "battery_heater_no_power"
        case climateKeeperMode = "climate_keeper_mode"
        case defrostMode = "defrost_mode"
        case driverTempSetting = "driver_temp_setting"
        case fanStatus = "fan_status"
        case insideTemp = "inside_temp"
        case isAutoConditioningOn = "is_auto_conditioning_on"
        case isClimateOn = "is_climate_on"
        case isFrontDefrosterOn = "is_front_defroster_on"
        case isPreconditioning = "is_preconditioning"
        case isRearDefrosterOn = "is_rear_defroster_on"
        case leftTempDirection = "left_temp_direction"
        case maxAvailTemp = "max_avail_temp"
        case minAvailTemp = "min_avail_temp"
        case outsideTemp = "outside_temp"
        case passengerTempSetting = "passenger_temp_setting"
        case remoteHeaterControlEnabled = "remote_heater_control_enabled"
        case rightTempDirection = "right_temp_direction"
        case seatHeaterLeft = "seat_heater_left"
        case seatHeaterRight = "seat_heater_right"
        case sideMirrorHeaters = "side_mirror_heaters"
        case timestamp
        case wiperBladeHeater = "wiper_blade_heater"
    }
}

// MARK: - DriveState
struct DriveState: Codable {
    let gpsAsOf, heading: Int
    let latitude, longitude, nativeLatitude: Double
    let nativeLocationSupported: Int
    let nativeLongitude: Double
    let nativeType: String
    let power: Int
    let shiftState, speed: String? // Todo: Confirm type
    let timestamp: Int

    enum CodingKeys: String, CodingKey {
        case gpsAsOf = "gps_as_of"
        case heading, latitude, longitude
        case nativeLatitude = "native_latitude"
        case nativeLocationSupported = "native_location_supported"
        case nativeLongitude = "native_longitude"
        case nativeType = "native_type"
        case power
        case shiftState = "shift_state"
        case speed, timestamp
    }
}

// MARK: - GUISettings

struct GUISettings: Codable {
    let gui24_HourTime: Bool
    let guiChargeRateUnits, guiDistanceUnits, guiRangeDisplay, guiTemperatureUnits: String
    let showRangeUnits: Bool
    let timestamp: Int

    enum CodingKeys: String, CodingKey {
        case gui24_HourTime = "gui_24_hour_time"
        case guiChargeRateUnits = "gui_charge_rate_units"
        case guiDistanceUnits = "gui_distance_units"
        case guiRangeDisplay = "gui_range_display"
        case guiTemperatureUnits = "gui_temperature_units"
        case showRangeUnits = "show_range_units"
        case timestamp
    }
}

// MARK: - VehicleState

struct VehicleState: Codable {
    let apiVersion: Int
    let autoparkStateV2, autoparkStyle: String
    let calendarSupported: Bool
    let carVersion: String
    let centerDisplayState, df, dr, fdWindow: Int
    let fpWindow, ft, homelinkDeviceCount: Int
    let homelinkNearby, isUserPresent: Bool
    let lastAutoparkError: String
    let locked: Bool
    let mediaState: MediaState
    let notificationsSupported: Bool
    let odometer: Double
    let parsedCalendarSupported: Bool
    let pf, pr, rdWindow: Int
    let remoteStart, remoteStartEnabled, remoteStartSupported: Bool
    let rpWindow, rt: Int
    let sentryMode, sentryModeAvailable, smartSummonAvailable: Bool
    let softwareUpdate: SoftwareUpdate
    let speedLimitMode: SpeedLimitMode
    let summonStandbyModeEnabled: Bool
    let sunRoofPercentOpen: Int
    let sunRoofState: String
    let timestamp: Int
    let valetMode, valetPinNeeded: Bool
    let vehicleName: String?

    enum CodingKeys: String, CodingKey {
        case apiVersion = "api_version"
        case autoparkStateV2 = "autopark_state_v2"
        case autoparkStyle = "autopark_style"
        case calendarSupported = "calendar_supported"
        case carVersion = "car_version"
        case centerDisplayState = "center_display_state"
        case df, dr
        case fdWindow = "fd_window"
        case fpWindow = "fp_window"
        case ft
        case homelinkDeviceCount = "homelink_device_count"
        case homelinkNearby = "homelink_nearby"
        case isUserPresent = "is_user_present"
        case lastAutoparkError = "last_autopark_error"
        case locked
        case mediaState = "media_state"
        case notificationsSupported = "notifications_supported"
        case odometer
        case parsedCalendarSupported = "parsed_calendar_supported"
        case pf, pr
        case rdWindow = "rd_window"
        case remoteStart = "remote_start"
        case remoteStartEnabled = "remote_start_enabled"
        case remoteStartSupported = "remote_start_supported"
        case rpWindow = "rp_window"
        case rt
        case sentryMode = "sentry_mode"
        case sentryModeAvailable = "sentry_mode_available"
        case smartSummonAvailable = "smart_summon_available"
        case softwareUpdate = "software_update"
        case speedLimitMode = "speed_limit_mode"
        case summonStandbyModeEnabled = "summon_standby_mode_enabled"
        case sunRoofPercentOpen = "sun_roof_percent_open"
        case sunRoofState = "sun_roof_state"
        case timestamp
        case valetMode = "valet_mode"
        case valetPinNeeded = "valet_pin_needed"
        case vehicleName = "vehicle_name"
    }
}

// MARK: - MediaState

struct MediaState: Codable {
    let remoteControlEnabled: Bool

    enum CodingKeys: String, CodingKey {
        case remoteControlEnabled = "remote_control_enabled"
    }
}

// MARK: - SoftwareUpdate

struct SoftwareUpdate: Codable {
    let downloadPerc, expectedDurationSEC, installPerc: Int
    let status, version: String

    enum CodingKeys: String, CodingKey {
        case downloadPerc = "download_perc"
        case expectedDurationSEC = "expected_duration_sec"
        case installPerc = "install_perc"
        case status, version
    }
}

// MARK: - SpeedLimitMode

struct SpeedLimitMode: Codable {
    let active: Bool
    let currentLimitMph, maxLimitMph, minLimitMph: Int
    let pinCodeSet: Bool

    enum CodingKeys: String, CodingKey {
        case active
        case currentLimitMph = "current_limit_mph"
        case maxLimitMph = "max_limit_mph"
        case minLimitMph = "min_limit_mph"
        case pinCodeSet = "pin_code_set"
    }
}
