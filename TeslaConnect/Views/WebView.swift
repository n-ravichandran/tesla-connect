//
//  WebView.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 2/27/22.
//

import SwiftUI
import WebKit

protocol URLProvider: AnyObject {
    
    var url: URL { get }
    
}

struct WebView: UIViewRepresentable {
    
    var delegate: (WKNavigationDelegate & URLProvider)?
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = delegate
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = delegate?.url else {
            return
        }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
}
