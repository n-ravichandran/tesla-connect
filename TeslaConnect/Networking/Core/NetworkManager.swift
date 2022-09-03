//
//  NetworkManager.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 3/3/22.
//

import Foundation

import Foundation

protocol APIService {
    var client: NetworkClient { get }
}

extension APIService {
    var client: NetworkClient { NetworkManager.shared.client }
}

public class NetworkManager {

    static let shared = NetworkManager()

    private var sessionExpiredHandler: (() -> Void)?
    let client = NetworkClient()

    private init() {
        client.delegate = self
    }

    public static func configure(authTokenProvider: AuthTokenProvider, sessionExpiredHandler: @escaping (() -> Void)) {
        shared.client.authTokenProvider = authTokenProvider
        shared.sessionExpiredHandler = sessionExpiredHandler
    }

}

// MARK: - NetworkClientDelegate

extension NetworkManager: NetworkClientDelegate {
    
    public func sessionExpired() {
        sessionExpiredHandler?()
    }

}
