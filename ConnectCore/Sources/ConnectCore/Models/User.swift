//
//  User.swift
//  
//
//  Created by Niranjan Ravichandran on 8/7/24.
//

import Foundation

public struct User: Codable {
    public let name: String
    public let email: String
    public let profileImageURL: String?

    enum CodingKeys: String, CodingKey {
        case name = "full_name"
        case email
        case profileImageURL = "profile_image_url"
    }
}
