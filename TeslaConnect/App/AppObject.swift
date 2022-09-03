//
//  AppObject.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 2/28/22.
//

import Foundation

class AppObject: ObservableObject {
        
    @Published var isAuthenticatedWithTesla: Bool
    
    init() {
        isAuthenticatedWithTesla = GroupKeychain.credentials != nil
        Log("Is previously authenticated: \(isAuthenticatedWithTesla)")
        NetworkManager.configure(authTokenProvider: AuthenticationManager.shared) {
            self.isAuthenticatedWithTesla = false
        }
    }
    
    func logout() {
        GroupKeychain.credentials = nil
        updateAuthStatus()
    }

    func updateAuthStatus() {
        isAuthenticatedWithTesla = GroupKeychain.credentials != nil
    }
    
}
