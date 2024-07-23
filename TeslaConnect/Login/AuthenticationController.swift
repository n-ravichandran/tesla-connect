//
//  AuthenticationController.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 2/27/22.
//

import Combine
import ConnectKit
import CryptoKit
import Foundation
import WebKit

class AuthenticationController: NSObject, ObservableObject {
    
    private static let CallbackURL = "https://nravichan.com/tezconnect?code"
    private static let clientID = ""
    private static let clientSecret = ""

    private let state = String.randon(length: 10)
    private let codeVerifier = String.randon(length: 86)
    private var currentCodeChallenge: String?

    let service = TeslaService()
    var cancellables: Set<AnyCancellable> = []
    var appObject: AppObject?

    private var nonce: String {
        String.randon(length: 10).md5Hash
    }

    func authorizeWithTesla(using code: String) {
        service.getBearerToken(from: code, clientID: Self.clientID, clientSecret: Self.clientSecret)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .finished:
                    Log("Authorization complete")
                case .failure(let error):
                    Log("failed to get accessToken - \(error.localizedDescription)", level: .warn)
                }
            } receiveValue: { credentials in
                Log("Received access token")
                GroupKeychain.credentials = credentials
                self.appObject?.updateAuthStatus()
            }
            .store(in: &cancellables)
    }
    
}

// MARK: - URLProvider

extension AuthenticationController: URLProvider {
    
    var url: URL {
        makeURL()
    }
    
    private var codeChallenge: String {
        let data = Data(codeVerifier.utf8)
        let hashed = SHA256.hash(data: data)
        let encoded = Data(hashed).base64EncodedString()
        return encoded
    }
    
    func makeURL() -> URL {
        var components = URLComponents(string: "https://auth.tesla.com/oauth2/v3/authorize")!
        components.queryItems = [
            URLQueryItem(name: "response_type", value: "code"),
            URLQueryItem(name: "client_id", value: Self.clientID), // Todo: inject this from build settings
            URLQueryItem(name: "redirect_uri", value: "https://nravichan.com/tezconnect"),
            URLQueryItem(name: "scope", value: "openid offline_access user_data vehicle_device_data vehicle_cmds vehicle_charging_cmds"),
            URLQueryItem(name: "state", value: state),
            URLQueryItem(name: "nonce", value: nonce),
        ]

        Log("url: \(components.url!)")
        return components.url!
    }

}

// MARK: - WKNavigationDelegate

extension AuthenticationController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        Log("navigating to: \(navigationAction.request.url!.absoluteString)")
        if (navigationAction.request.url?.absoluteString.contains(Self.CallbackURL)).isTrue {
            handleCallback(url: navigationAction.request.url)
            decisionHandler(.cancel)
            return
        }
        decisionHandler(.allow)
    }
    
    func handleCallback(url: URL?) {
        let components = URLComponents(string: url?.absoluteString ?? "")
        guard let code = components?.queryItems?.first(where: { $0.name == "code" })?.value else {
            Log("Unable to get code from callback")
            return
        }
        Log("Code: \(code)")
        authorizeWithTesla(using: code)
    }
    
}
