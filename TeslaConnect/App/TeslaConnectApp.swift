//
//  TeslaConnectApp.swift
//  TeslaConnect
//
//  Created by Niranjan Ravichandran on 2/27/22.
//

import SwiftUI

@main
struct TeslaConnectApp: App {
    
    let persistenceController = PersistenceController.shared
    @StateObject var appObject = AppObject()

    var body: some Scene {
        WindowGroup {
            if appObject.isAuthenticatedWithTesla {
                HomeView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .environmentObject(appObject)
            } else {
            LoginView()
                .environmentObject(appObject)
            }
        }
    }
    
}
