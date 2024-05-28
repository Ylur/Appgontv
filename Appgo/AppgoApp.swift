//  AppgoApp.swift
//  Appgo
//  Created by Ingi Haraldss on 5.5.2024.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

class AppDelegate: NSObject, UIApplicationDelegate {
  
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        //Firebase fyrst
        FirebaseApp.configure()
        return true
    }
}

@main
struct Appgo: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    let locationManager = LocationManager()

    init() {
        // svo firestore
        DispatchQueue.main.async {
            let settings = FirestoreSettings()
            Firestore.firestore().settings = settings
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel())
                .environmentObject(LocationManager())
        }
    }
}
