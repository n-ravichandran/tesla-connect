//
//  HomeViewModel.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 9/3/22.
//

import Foundation

enum VehicleError: Error {
    case noVehicle
}

class HomeViewModel: ObservableObject {

    private let service = TeslaService()

    @Published var primaryVehicle: VehicleViewModel?
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

    func mockVehicleViewModel() -> VehicleViewModel {
        VehicleViewModel(
            id: 1234565,
            displayName: "Starlight",
            model: .modelX,
            state: "online",
            batteryLevel: 50,
            batteryRange: 325,
            exteriorColor: "White"
        )
    }

}
