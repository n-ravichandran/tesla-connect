//
//  AuthenticationController.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 2/27/22.
//

import Combine
import CryptoKit
import Foundation
import WebKit

class AuthenticationController: NSObject, ObservableObject {
    
    private static let CallbackURL = "https://auth.tesla.com/void/callback?code="
    
    private let state = String.randon(length: 10)
    private let codeVerifier = String.randon(length: 86)
    private var currentCodeChallenge: String?

    let service = TeslaService()
    var cancellables: Set<AnyCancellable> = []
    var appObject: AppObject?
    
    func authorizeWithTesla(using code: String) {
        service.getBearerToken(from: code, codeVerifier: codeVerifier)
            .sink { completion in
                switch completion {
                case .finished:
                    Log("Authorization complete")
                case .failure(let error):
                    Log(error.localizedDescription)
                }
            } receiveValue: { credentials in
                print("Received access token")
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
        let code = codeChallenge
        currentCodeChallenge = code
        Log("State: \(state) | code_verifier: \(codeVerifier) | code_challenge: \(code)")
        return URL(string: "https://auth.tesla.com/oauth2/v3/authorize?client_id=ownerapi&code_challenge_method=S256&response_type=code&code_challenge=\(code)&redirect_uri=https%3A%2F%2Fauth.tesla.com%2Fvoid%2Fcallback&scope=openid+email+offline_access&state=\(state)")!
    }

}

// MARK: - WKNavigationDelegate

extension AuthenticationController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
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
