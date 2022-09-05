//
//  TeslaConnectApp.swift
//  TeslaConnect Watch WatchKit Extension
//
//  Created by Niranjan Ravichandran on 9/5/22.
//

import SwiftUI

@main
struct TeslaConnectApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
