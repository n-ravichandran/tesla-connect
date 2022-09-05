//
//  VehicleViewModel.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 9/4/22.
//

import ConnectCore
import SwiftUI

public struct VehicleViewModel {
    public let id: Int
    public let displayName: String
    public let model: VehicleModel
    public let state: String
    public let batteryLevel: Int
    public let batteryRange: Double
    public let exteriorColor: String
    public let isLocked: Bool
    public let interiorTemperature: String
    public let isAnyWindowOpen: Bool

    public var imageName: String {
        switch model {
            case .modelS: return "model_s"
            case .model3: return "model_3"
            case .modelX: return "model_x"
            case .modelY: return "model_y"
        }
    }

    public var batteryLevelString: String {
        "\(batteryLevel)%"
    }

    public var batteryLevelImageName: String {
        switch batteryLevel {
            case 100: return "battery.100"
            case 75...100: return "battery.75"
            case 50...75: return "battery.50"
            default: return "battery.25"
        }
    }

    public var batteryColor: Color {
        switch batteryLevel {
            case 40...100: return .green
            case 20...40: return .yellow
            case 0...20: return .red
            default: return .black
        }
    }

    public init(
        id: Int,
        displayName: String,
        model: VehicleModel,
        state: String,
        batteryLevel: Int,
        batteryRange: Double,
        exteriorColor: String,
        isLocked: Bool,
        interiorTemperature: String,
        isAnyWindowOpen: Bool
    ) {
        self.id = id
        self.displayName = displayName
        self.model = model
        self.state = state
        self.batteryLevel = batteryLevel
        self.batteryRange = batteryRange
        self.exteriorColor = exteriorColor
        self.isLocked = isLocked
        self.interiorTemperature = interiorTemperature
        self.isAnyWindowOpen = isAnyWindowOpen
    }

    public init(data: VehicleData) {
        self.id = data.id
        self.displayName = data.displayName
        self.model = VehicleModel(value: data.vehicleConfig.carType)
        self.state = data.state
        self.batteryLevel = data.chargeState.batteryLevel
        self.batteryRange = data.chargeState.estBatteryRange
        self.exteriorColor = data.vehicleConfig.exteriorColor
        self.isLocked = data.vehicleState.locked
        self.interiorTemperature = UnitTemperature.temperatureString(value: data.climateState.insideTemp, unitString: data.guiSettings.guiTemperatureUnits)
        self.isAnyWindowOpen = data.vehicleState.fdWindow != 0
        || data.vehicleState.fpWindow != 0
        || data.vehicleState.rdWindow != 0
        || data.vehicleState.rpWindow != 0
    }
}
