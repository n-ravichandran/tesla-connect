//
//  BearerTokenRequestParams.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 3/3/22.
//

import Foundation
import Alamofire

struct BearerTokenRequestParams: Codable {
    private let grantType = "authorization_code"
    private let redirectURI = "https://nravichan.com/tezconnect"
    private let audience = "https://fleet-api.prd.na.vn.cloud.tesla.com"

    let clientID: String
    let clientSecret: String
    let code: String

    enum CodingKeys: String, CodingKey {
        case audience
        case clientID = "client_id"
        case clientSecret = "client_secret"
        case code
        case grantType = "grant_type"
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
