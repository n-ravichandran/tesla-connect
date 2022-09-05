//
//  VehicleViewModel.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 9/4/22.
//

import Foundation
import SwiftUI

struct VehicleViewModel {
    let id: Int
    let displayName: String
    let model: VehicleModel
    let state: String
    let batteryLevel: Int
    let batteryRange: Double
    let exteriorColor: String
    let isLocked: Bool
    let interiorTemperature: String
    let isAnyWindowOpen: Bool

    var imageName: String {
        switch model {
            case .modelS: return "model_s"
            case .model3: return "model_3"
            case .modelX: return "model_x"
            case .modelY: return "model_y"
        }
    }

    var batteryLevelString: String {
        "\(batteryLevel)%"
    }

    var batteryLevelImageName: String {
        switch batteryLevel {
            case 100: return "battery.100"
            case 75...100: return "battery.75"
            case 50...75: return "battery.50"
            default: return "battery.25"
        }
    }

    var batteryColor: Color {
        switch batteryLevel {
            case 40...100: return .green
            case 20...40: return .yellow
            case 0...20: return .red
            default: return .black
        }
    }

    init(
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

    init(data: VehicleData) {
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
