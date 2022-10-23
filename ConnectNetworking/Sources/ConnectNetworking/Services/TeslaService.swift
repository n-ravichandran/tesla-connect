//
//  TeslaService.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 2/28/22.
//

import Combine
import ConnectCore
import Foundation
import Alamofire

public class TeslaService: APIService {

    public init() {}

    public func getVehicles() async throws -> [Vehicle] {
        try await client.request(
            requestBuilder: APIEndpoint.vehicles,
            responseType: VehicelsAPIResponse.self
        ).response
    }

    public func getVehicle(for id: Int) async throws -> Vehicle {
        try await client.request(
            requestBuilder: APIEndpoint.vehicle(id: id),
            responseType: Vehicle.self
        )
    }

    public func getVehicleData(for id: Int) async throws -> VehicleData {
        try await client.request(
            requestBuilder: APIEndpoint.vehicleData(id: id),
            responseType: VehicleDataAPIResponse.self
        ).data
    }
    
}

// MARK: - Authentication

// Todo: Migrate to use async/await
public extension TeslaService {

    func getBearerToken(from authorizationCode: String, codeVerifier: String) -> AnyPublisher<Credentials, APIError> {
        let parameters = BearerTokenRequestParams(code: authorizationCode, codeVerifier: codeVerifier)
        return client.rawRequest(requestBuilder: APIEndpoint.bearerToken(parameters), responseType: Credentials.self)
    }

    func refreshAccessToken(with refreshToken: String) -> AnyPublisher<Credentials, APIError> {
        let parameters = RefreshTokenRequestParam(refreshToken: refreshToken)
        return client.rawRequest(requestBuilder: APIEndpoint.refreshToken(parameters), responseType: Credentials.self)
    }

}
