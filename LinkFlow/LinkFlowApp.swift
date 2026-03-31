//
//  LinkFlowApp.swift
//  LinkFlow
//
//  Created by Vikram Kumar on 22/03/26.
//

import SwiftUI
import Firebase

@main
struct LinkFlowApp: App {
    
    init() {
          FirebaseApp.configure()   // ✅ ADD THIS
      }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
