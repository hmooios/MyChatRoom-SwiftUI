//
//  MyChatRoom_SwiftUIApp.swift
//  MyChatRoom-SwiftUI
//
//  Created by Hmoo Myat Theingi on 05/01/2024.
//

import SwiftUI
import FirebaseCore

@main
struct MyChatRoom_SwiftUIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
    
 
}
