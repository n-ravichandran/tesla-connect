//
//  AuthenticationManager.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 3/3/22.
//

import ConnectKit
import ConnectNetworking
import Foundation

public class AuthenticationManager: AuthTokenProvider {
    
    static let shared = AuthenticationManager()
        
    public var accessToken: String? {
        GroupKeychain.credentials?.accessToken
    }

    public var refreshToken: String? {
        GroupKeychain.credentials?.refreshToken
    }
    
}
