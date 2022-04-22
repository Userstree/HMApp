//
//  HMAppApp.swift
//  HMApp
//
//  Created by Dossymkhan Zhulamanov on 15.01.2022.
//

import SwiftUI
import Firebase
import GoogleSignIn

let colorNavAppearance = UINavigationBarAppearance()

@main
struct HMAppApp: App {
    @StateObject var viewModel = UserDetailsViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init()
    {
        colorNavAppearance.configureWithOpaqueBackground()
        colorNavAppearance.backgroundColor = UIColor.mainDarkBlueBackgroundColor
        colorNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        colorNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = colorNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = colorNavAppearance
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
    func application(_ application: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any])
    -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
    
}
