//
//  VehiclesAPIResponse.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 9/3/22.
//

import ConnectCore
import Foundation

struct VehicelsAPIResponse: Decodable {
    let response: [Vehicle]
    let count: Int
}

struct VehicleDataAPIResponse: Decodable {
    let data: VehicleData

    enum CodingKeys: String, CodingKey {
        case data = "response"
    }
}
