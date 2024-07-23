//
//  File.swift
//  
//
//  Created by Niranjan Ravichandran on 7/22/24.
//

import Foundation

public struct Configuration {
    public let clientID: String
    public let clientSecret: String
    public let redirectURI: String
    public let callbackURL: String

    public init() {
        guard let path = Bundle.module.path(forResource: "Config", ofType: "plist"),
              let configDictionary = NSDictionary(contentsOfFile: path) as? [String: String],
              let clientID = configDictionary["Client_ID"],
              let clientSecret = configDictionary["Client_Secret"],
              let redirectURI = configDictionary["Redirect_URI"],
              let callbackURL = configDictionary["Callback_URL"]
        else {
            fatalError("Could not load client configuration!!!")
        }
        
        self.clientID = clientID
        self.clientSecret = clientSecret
        self.redirectURI = redirectURI
        self.callbackURL = callbackURL
    }
}
