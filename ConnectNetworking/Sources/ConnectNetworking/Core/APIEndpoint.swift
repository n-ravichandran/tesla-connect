//
//  APIEndpoint.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 3/3/22.
//

import Alamofire
import Foundation

private enum URLConstant {
    static let fleet = "https://fleet-api.prd.na.vn.cloud.tesla.com"
    static let auth = "https://auth.tesla.com/oauth2/v3/token"
}

enum APIEndpoint: URLRequestBuilder {
    case bearerToken(_ parameters: BearerTokenRequestParams)
    case refreshToken(_ parameters: RefreshTokenRequestParam)
    case vehicles
    case vehicle(id: Int)
    case vehicleData(id: Int)
    
    var path: String {
        switch self {
            case .bearerToken:
                return ""
            case .refreshToken:
                return "/oauth/token"
            case .vehicles:
                return "/api/1/vehicles"
            case .vehicle(let id):
                return "/api/1/vehicles/\(id)"
            case .vehicleData(let id):
                return "/api/1/vehicles/\(id)/vehicle_data"
        }
    }
    
    var method: HTTPMethod {
        switch self {
            case .bearerToken,
                    .refreshToken:
                return .post
            case .vehicle, .vehicles, .vehicleData:
                return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
            case .bearerToken(let parameters):
                return parameters.dictionary
            case .refreshToken(let parameters):
                return parameters.dictionary
            case .vehicle, .vehicles, .vehicleData:
                return nil
        }
    }
    
    var headers: HTTPHeaders {
        return .init()
    }
    
    var isAuthEndpoint: Bool {
        switch self {
            case .bearerToken, .refreshToken:
                return true
            case .vehicle, .vehicles, .vehicleData:
                return false
        }
    }
}

public protocol URLRequestBuilder: URLRequestConvertible {
    var isAuthEndpoint: Bool { get }

    var path: String { get }

    var method: HTTPMethod { get }

    var headers: HTTPHeaders { get }

    var parameters: Parameters? { get }

    // MARK: Defaults

    var requestURL: URL { get }

    var encoding: ParameterEncoding { get }
}

extension URLRequestBuilder {
    var requestURL: URL {
        if isAuthEndpoint {
            return URL(string: URLConstant.auth)!
        }
        return URL(string: URLConstant.fleet)!.appendingPathComponent(path)
    }

    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding(arrayEncoding: .noBrackets)
        default:
            return JSONEncoding.default
        }
    }

    var headers: HTTPHeaders { .init() }

    var urlRequest: URLRequest {
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        headers.forEach { request.headers.add($0) }
        return request
    }

    func asURLRequest() throws -> URLRequest {
        try encoding.encode(urlRequest, with: parameters)
    }
}
