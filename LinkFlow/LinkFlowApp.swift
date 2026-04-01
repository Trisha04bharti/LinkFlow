//
//  LinkFlowApp.swift
//  LinkFlow
//
//  Created by Vikram Kumar on 22/03/26.
//

import SwiftUI
import FirebaseCore   // ✅ important

// ✅ Step 1: AppDelegate
class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        FirebaseApp.configure()   // ✅ Firebase starts here
        
        return true
    }
}

@main
struct LinkFlowApp: App {
    
    // ✅ Step 2: connect AppDelegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
