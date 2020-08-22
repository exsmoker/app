//
//  ExSmokerApp.swift
//  ExSmoker (watchOS) Extension
//
//  Created by vaux on 22.08.20.
//

import SwiftUI

@main
struct ExSmokerApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
