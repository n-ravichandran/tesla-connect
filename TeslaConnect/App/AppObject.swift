//
//  AppObject.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 2/28/22.
//

import ConnectKit
import Foundation
import Mixpanel

class AppObject: ObservableObject {
        
    @Published var isAuthenticatedWithTesla: Bool
    
    init() {
        isAuthenticatedWithTesla = GroupKeychain.credentials != nil
        Log("Is previously authenticated: \(isAuthenticatedWithTesla)")
        setupAnalytics()
        NetworkManager.configure(authTokenProvider: AuthenticationManager.shared) {
            self.isAuthenticatedWithTesla = false
        }
    }
    
    func logout() {
        GroupKeychain.credentials = nil
        clearCookies()
        updateAuthStatus()
    }

    func clearCookies(){
        let cookieJar = HTTPCookieStorage.shared

        for cookie in cookieJar.cookies! {
            cookieJar.deleteCookie(cookie)
        }
    }

    func updateAuthStatus() {
        isAuthenticatedWithTesla = GroupKeychain.credentials != nil
    }

    func setupAnalytics() {
        Mixpanel.initialize(token: "7dbad44110c014b58d1f6221518dd4aa", trackAutomaticEvents: true)
    }
    
}
