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
