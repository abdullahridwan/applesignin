//
//  apple_signin_testApp.swift
//  Shared
//
//  Created by Abdullah Ridwan on 8/25/21.
//

import SwiftUI
import Firebase

@main
struct apple_signin_testApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


//Initializing Firebase
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
