//
//  APIError.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 3/4/22.
//

import Alamofire
import ConnectCore
import Foundation

public struct NetworkError: Error {
    let afError: AFError
    let httpStatus: HTTPStatus
    let underlyingError: Error?
}

public enum APIError: Error {
    
    case cancelled
    case backend(Error)
    case network(reason: String)
    case noConnectivity
    case noConnectionToHost
    case noResponse
    case unauthorized
    case forbidden
    case timeout
    
    public init(error: AFError) {
        switch error {
        case .explicitlyCancelled:
            self = .cancelled
        default:
            self = .network(reason: error.localizedDescription)
        }
    }
    
    public init(afError: AFError?, underlyingError: Error?, response: HTTPURLResponse?) {
        if let error = underlyingError {
            let errorCode = (error as NSError).code
            
            if [-1005, -1009].contains(errorCode) {
                self = .noConnectivity
            }
            
            if [-1003, -1004].contains(errorCode) {
                self = .noConnectionToHost
            }
        }
        
        var httpStatus: HTTPStatus = .none
            if let status = HTTPStatus(rawValue: response?.statusCode ?? 0) {
            httpStatus = status
        } else {
            Log("Unhandled HTTP status code: \(response?.statusCode ?? 0) for \(response?.url?.absoluteString ?? "")")
        }
        
        switch httpStatus {
        case .unauthorized:
            self = .unauthorized
        case .forbidden:
            self = .forbidden
        case .internalServiceError:
            self = .network(reason: "Unknown Server error")
        case .serviceUnavailable:
            self = .network(reason: "Service unavailable")
        default:
            break
        }
        
        switch afError {
        case .explicitlyCancelled:
            self = .cancelled
        default:
            self = .network(reason: afError?.localizedDescription ?? "Unexpected error")
        }
    }
    
}
