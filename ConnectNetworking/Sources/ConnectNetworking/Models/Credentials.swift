//
//  Credentials.swift
//  
//
//  Created by Niranjan Ravichandran on 9/5/22.
//

import Foundation

public struct Credentials: Codable {

    public let accessToken: String
    public let refreshToken: String
    public let expiresIn: Int
    public let state: String?
    public let tokenType: String
    public let idToken: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
        case expiresIn = "expires_in"
        case state
        case tokenType = "token_type"
        case idToken = "id_token"
    }

}
