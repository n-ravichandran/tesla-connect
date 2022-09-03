//
//  HomeViewModel.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 9/3/22.
//

import Foundation

class HomeViewModel: ObservableObject {

    private let service = TeslaService()

    @Published var primaryVehicle: Vehicle?
    @Published var showActivity = false

    var vehicles: [Vehicle] = []

    func loadVehicles() {
        showActivity = true
        Task {
            do {
                let vehiclesFetched = try await service.getVehicles()
                await MainActor.run {
                    self.vehicles = vehiclesFetched
                    self.primaryVehicle = vehicles.first
                    self.showActivity = false
                    Log("Total vehicles: \(vehicles.count)")
                }
            } catch {
                Log("Vehicle load failed: \(error)")
                await MainActor.run {
                    self.showActivity = false
                }
            }
        }
    }

    func mockVehiclesData() -> [Vehicle] {
        [
            Vehicle(id: 12345678, vehicleID: 123456, vin: "5YJSA11111111111", displayName: "Starlight Y", optionCodes: "MDLS, RENA", color: nil, tokens: [], state: "online", inService: false, idString: "12345678", calendarEnabled: true, apiVersion: 7)
        ]
    }

}
