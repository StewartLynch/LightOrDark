//
//  LightOrDarkApp.swift
//  LightOrDark
//
//  Created by Stewart Lynch on 2022-01-15.
//

import SwiftUI

@main
struct LightOrDarkApp: App {
    @StateObject var csManager = ColorSchemeManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(csManager)
                .onAppear {
                     UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                    csManager.applyColorScheme()
                }
        }
    }
}
