//
//  WhatsAppCloneApp.swift
//  WhatsAppClone
//
//  Created by Vlad on 17/7/24.
//

import SwiftUI
import FirebaseCore

@main
struct WhatsAppCloneApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate


  var body: some Scene {
    WindowGroup {
        RootScreen()
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
