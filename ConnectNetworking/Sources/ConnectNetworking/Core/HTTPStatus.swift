//
//  HTTPStatus.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 3/4/22.
//

import Foundation

public enum HTTPStatus: Int, CustomStringConvertible {

    case ok = 200
    case accepted = 202
    case seeOther = 303
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
    case conflict = 409
    case unprocessedData = 422
    case internalServiceError = 500
    case serviceUnavailable = 503
    case none = 0
    
    public init(code: Int?) {
        let code = code ?? 0
        self = .init(rawValue: code) ?? .none
    }

    public var description: String {
        switch self {
        case .ok: return "OK"
        case .accepted: return "Accepted"
        case .seeOther: return "See Other"
        case .badRequest: return "Bad Request"
        case .unauthorized: return "Unauthorized"
        case .forbidden: return "Forbidden"
        case .notFound: return "Not Found"
        case .conflict: return "Conflict"
        case .unprocessedData: return "UnprocessedData"
        case .internalServiceError: return "Internal Service Error"
        case .serviceUnavailable: return "Service Unavailable"
        default: return "Unknown"
        }
    }

}
