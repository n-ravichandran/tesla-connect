//
//  TeslaService.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 2/28/22.
//

import Combine
import Foundation
import Alamofire

class TeslaService: APIService {

    func getVehicles() async throws -> [Vehicle] {
        try await client.request(
            requestBuilder: APIEndpoint.vehicles,
            responseType: VehicelsAPIResponse.self
        ).response
    }

    func getVehicle(for id: Int) async throws -> Vehicle {
        try await client.request(
            requestBuilder: APIEndpoint.vehicle(id: id),
            responseType: Vehicle.self
        )
    }

    func getVehicleData(for id: Int) async throws -> VehicleData {
        try await client.request(
            requestBuilder: APIEndpoint.vehicleData(id: id),
            responseType: VehicleData.self
        )
    }
    
}

// MARK: - Authentication

// Todo: Migrate to use async/await
extension TeslaService {

    func getBearerToken(from authorizationCode: String, codeVerifier: String) -> AnyPublisher<Credentials, APIError> {
        let parameters = BearerTokenRequestParams(code: authorizationCode, codeVerifier: codeVerifier)
        return client.rawRequest(requestBuilder: APIEndpoint.bearerToken(parameters), responseType: Credentials.self)
    }

    func refreshAccessToken(with refreshToken: String) -> AnyPublisher<Credentials, APIError> {
        let parameters = RefreshTokenRequestParam(refreshToken: refreshToken)
        return client.rawRequest(requestBuilder: APIEndpoint.refreshToken(parameters), responseType: Credentials.self)
    }

}
