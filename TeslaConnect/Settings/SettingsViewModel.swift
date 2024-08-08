//
//  SettingsViewModel.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 8/7/24.
//

import Foundation
import ConnectKit

class SettingsViewModel: ObservableObject {
    private let userService = UserService()
    private var user: User?

    @Published var name: String = "Loading..."

    init() {
        Task {
            do {
                user = try await userService.fetchUser()
                await MainActor.run {
                    name = user?.name ?? ""
                }
            } catch {
                Log("failed to fetch user profile: \(error)")

                await MainActor.run {
                    name = "Failed to load"
                }
            }
        }
    }
}
