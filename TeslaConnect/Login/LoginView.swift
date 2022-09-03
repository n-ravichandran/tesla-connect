//
//  LoginView.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 2/27/22.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var appObject: AppObject
    @State private var showWebView = false
    
    @ObservedObject private var authenticationController = AuthenticationController()
    
    var body: some View {
        VStack {
            Spacer()
            Text("Please authorize this app with Tesla to access or control your car from your Apple Watch.")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Spacer()
            Button {
                showWebView.toggle()
            } label: {
                Text("Authorize with Tesla")
            }
            .buttonStyle(PrimaryButtonStyle())

            Text("This app does not store your Tesla account username or password.")
                .font(.caption)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding()
        }
        .sheet(isPresented: $showWebView) {
            WebView(delegate: authenticationController)
        }.onAppear {
            authenticationController.appObject = appObject
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
