//
//  VehiclesAPIResponse.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 9/3/22.
//

import Foundation

struct VehicelsAPIResponse: Decodable {
    let response: [Vehicle]
    let count: Int
}
