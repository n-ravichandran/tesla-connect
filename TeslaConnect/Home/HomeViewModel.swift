//
//  HomeViewModel.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 9/3/22.
//

import ConnectKit
import UIKit
import CoreLocation

enum VehicleError: Error {
    case noVehicle
}

struct UnlockCardViewModel {
    var iconName: String
    var title: String

    static var lockState: Self { .init(iconName: "lock.fill", title: "Unlock") }
    static var unlockedState: Self { .init(iconName: "lock.open.fill", title: "Lock") }
}

struct LocationCardViewModel {
    var lat: Double
    var long: Double
    var address: String
    var isUpdating: Bool

    static var placeholder: Self {
        .init(lat: 40.7484, long: -73.9857, address: "Locating...", isUpdating: true)
    }
}

class HomeViewModel: ObservableObject {

    private let service = TeslaService()
    private let impactGenerator = UIImpactFeedbackGenerator(style: .medium)
    private var primaryVehicleData: VehicleData?

    @Published var primaryVehicle: VehicleViewModel?
    @Published var unlockCardViewModel: UnlockCardViewModel = .lockState
    @Published var locationCardViewModel: LocationCardViewModel = .placeholder
    @Published var showActivity = false

    func loadVehicles() {
        showActivity = true
        Task {
            do {
                let vehicleID = try await getPrimaryVehicleID()
                let vehicleData = try await service.getVehicleData(for: vehicleID)
                await MainActor.run {
                    self.primaryVehicle = VehicleViewModel(data: vehicleData)
//                    self.setupMock()
                    self.showActivity = false
                    self.populateLocation(lat: vehicleData.driveState.latitude, long: vehicleData.driveState.longitude)
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
        guard let primaryVehicle = primaryVehicle,
              let data = primaryVehicleData
        else {
            Log("No vehicle data")
            return
        }

        unlockCardViewModel = primaryVehicle.isLocked ? .lockState : .unlockedState
        populateLocation(lat: data.driveState.latitude, long: data.driveState.longitude)
    }

    func populateLocation(lat: Double, long: Double) {
        Task {
            let address = await getPostalAddress(lat: lat, long: long)
            await MainActor.run {
                locationCardViewModel = .init(
                    lat: lat,
                    long: long,
                    address: address ?? "Unable to retrive address",
                    isUpdating: false
                )
            }
        }
    }

}

// MARK: - Private Helpers

private extension HomeViewModel {

    func getPostalAddress(lat: Double, long: Double) async -> String? {
        await withCheckedContinuation { continuation in
            getPostalAddress(lat: lat, long: long) {
                continuation.resume(returning: $0)
            }
        }
    }

    func getPostalAddress(lat: Double, long: Double, completion: @escaping (String?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(CLLocation(latitude: lat, longitude: long)) { placemarks, error in
            if let error = error {
                Log("Failed to get address: \(error)")
                completion(nil)
            } else {
                let firstLocation = placemarks?[0]
                completion(firstLocation?.compactAddress)
            }
        }
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

    func setupMock() {
        primaryVehicle = mockVehicleViewModel()
        locationCardViewModel = .init(
            lat: 40.7484,
            long: -73.9857,
            address: "Locating...",
            isUpdating: true
        )
        populateLocation(lat: 40.7484, long: -73.9857)
    }

    func mockVehicleViewModel() -> VehicleViewModel {
        VehicleViewModel(
            id: 1234565,
            displayName: "Starlight",
            model: .modelY,
            state: "online",
            batteryLevel: 80,
            batteryRange: "300 mile",
            exteriorColor: "White",
            isLocked: true,
            interiorTemperature: "22℃",
            exteriorTemperature: "10℃",
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
            batteryRange: "300 miles",
            exteriorColor: "White",
            isLocked: isLocked,
            interiorTemperature: "22℃",
            exteriorTemperature: "10℃",
            isAnyWindowOpen: true
        )
        update()
    }
}
