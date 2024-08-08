//
//  File.swift
//  
//
//  Created by Niranjan Ravichandran on 8/7/24.
//

import ConnectCore
import Foundation

public class UserService: APIService {
    public init() {}
    
    public func fetchUser() async throws -> User {
        try await client.request(requestBuilder: APIEndpoint.user, responseType: UserAPIResponse.self).response
    }
}
