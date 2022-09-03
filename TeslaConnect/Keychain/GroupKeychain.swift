//
//  GroupKeychain.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 2/28/22.
//

import Foundation

private let keychain = Keychain(service: Bundle.main.keychainService, group: Bundle.main.keychainGroup)

public enum GroupKeychain {
    
    public static var credentials: Credentials? {
        get {
            guard let data = GroupKeychain.credentialsData else { return nil }
            return try? JSONDecoder().decode(Credentials.self, from: data)
        }
        set {
            guard let value = newValue else {
                GroupKeychain.credentialsData = nil
                return
            }
            GroupKeychain.credentialsData = try? JSONEncoder().encode(value)
        }
    }
    
    @KeychainItem(keychain, "Credentials")
    private static var credentialsData: Data? = nil

}
