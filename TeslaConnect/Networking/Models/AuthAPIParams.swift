//
//  Models.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 3/3/22.
//

import Foundation
import Alamofire

struct BearerTokenRequestParams: Codable {
    
    private let grantType: String = "authorization_code"
    private let clientID: String = "ownerapi"
    private let redirectURI: String = "https://auth.tesla.com/void/callback"
    let code: String
    let codeVerifier: String
    
    enum CodingKeys: String, CodingKey {
        case grantType = "grant_type"
        case clientID = "client_id"
        case code
        case codeVerifier = "code_verifier"
        case redirectURI = "redirect_uri"
    }
    
}

struct RefreshTokenRequestParam: Codable {
    
    private let grantType = "refresh_token"
    private let clientID = "ownerapi"
    private let scope = "openid email offline_access"
    let refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        case grantType = "grant_type"
        case clientID = "client_id"
        case refreshToken = "refresh_token"
        case scope
    }
    
}

public struct Credentials: Codable {
    
    let accessToken: String
    let refreshToken: String
    let expiresIn: Int
    let state: String?
    let tokenType: String
    let idToken: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
        case expiresIn = "expires_in"
        case state
        case tokenType = "token_type"
        case idToken = "id_token"
    }
    
}
