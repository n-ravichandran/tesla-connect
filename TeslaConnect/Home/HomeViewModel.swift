//
//  HomeViewModel.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 9/3/22.
//

import ConnectKit
import UIKit

enum VehicleError: Error {
    case noVehicle
}

struct UnlockCardViewModel {
    var iconName: String
    var title: String

    static var lockState: Self { .init(iconName: "lock.fill", title: "Unlock") }
    static var unlockedState: Self { .init(iconName: "lock.open.fill", title: "Lock") }
}

class HomeViewModel: ObservableObject {

    private let service = TeslaService()
    private let impactGenerator = UIImpactFeedbackGenerator(style: .medium)

    @Published var primaryVehicle: VehicleViewModel?
    @Published var unlockCardViewModel: UnlockCardViewModel = .lockState
    @Published var showActivity = false

    func loadVehicles() {
        showActivity = true
        Task {
            do {
//                let vehicleID = try await getPrimaryVehicleID()
//                let vehicleData = try await service.getVehicleData(for: vehicleID)
                await MainActor.run {
                    self.primaryVehicle = mockVehicleViewModel() // VehicleViewModel(data: vehicleData)
                    self.showActivity = false
                }
            } catch {
                Log("Vehicle load failed: \(error)")
                await MainActor.run {
                    self.showActivity = false
                }
            }
        }
    }

    func getPrimaryVehicleID() async throws -> Int {
        if let vehicleID = GroupKeychain.primaryVehicleID {
            return vehicleID
        }

        let vehiclesFetched = try await service.getVehicles()
        guard let vehicleID = vehiclesFetched.first?.id else {
            throw VehicleError.noVehicle
        }

        return vehicleID
    }

    func update() {
        guard let primaryVehicle = primaryVehicle else {
            return
        }

        unlockCardViewModel = primaryVehicle.isLocked ? .lockState : .unlockedState
    }

}

// MARK: - Commands

extension HomeViewModel {

    func toggleLockState() {
        impactGenerator.impactOccurred()
        simulateLockToggle()
    }

}

// MARK: - Simulation Helpers

private extension HomeViewModel {

    func mockVehicleViewModel() -> VehicleViewModel {
        VehicleViewModel(
            id: 1234565,
            displayName: "Starlight",
            model: .modelY,
            state: "online",
            batteryLevel: 50,
            batteryRange: 325,
            exteriorColor: "White",
            isLocked: true,
            interiorTemperature: "22℃",
            isAnyWindowOpen: true
        )
    }

    func simulateLockToggle() {
        var isLocked = primaryVehicle?.isLocked ?? true
        isLocked.toggle()
        primaryVehicle = VehicleViewModel(
            id: 1234565,
            displayName: "Starlight",
            model: .modelS,
            state: "online",
            batteryLevel: 50,
            batteryRange: 325,
            exteriorColor: "White",
            isLocked: isLocked,
            interiorTemperature: "22℃",
            isAnyWindowOpen: true
        )
        update()
    }
}
