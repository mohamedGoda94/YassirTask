//
//  AppDelegate.swift
//  YassirTask
//
//  Created by Mohamed Goda on 31/07/2023.
//

import UIKit
import Resolver

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        AppManager().startApp(window: window)
        return true
    }
}

