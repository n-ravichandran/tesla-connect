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

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
