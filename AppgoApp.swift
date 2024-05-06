//
//  AppgoApp.swift
//  Appgo
//
//  Created by Ingi Haraldss on 5.5.2024.
//

import SwiftUI

@main
struct AppgoApp: App {
    @StateObject private var authViewModel = AuthViewModel()
    @StateObject private var locationManager = LocationManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel)
                .environmentObject(locationManager)
        }
    }
}


