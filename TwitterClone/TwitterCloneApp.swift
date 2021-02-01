//
//  TwitterCloneApp.swift
//  TwitterClone
//
//  Created by chihsien  on 2021/1/28.
//

import SwiftUI
import Firebase

@main
struct TwitterCloneApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
