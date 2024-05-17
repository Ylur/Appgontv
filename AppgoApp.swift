//  AppgoApp.swift
//  Appgo
//
//  Created by Ingi Haraldss on 5.5.2024.
//

//  AppgoApp.swift
//  Appgo
//
//  Created by Ingi Haraldss on 5.5.2024.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct Appgo: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init() {
        // passa að firestore komi eftir firebaseapp config
        DispatchQueue.main.async {
            let settings = FirestoreSettings()
            Firestore.firestore().settings = settings
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel())
        }
    }
}
