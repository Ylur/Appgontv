//
//  AppgoApp.swift
//  Appgo
//
//  Created by Ingi Haraldss on 5.5.2024.
//

import SwiftUI

@main
struct YourApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel())
        }
    }
}


