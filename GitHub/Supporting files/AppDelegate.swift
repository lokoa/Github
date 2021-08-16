//
//  AppDelegate.swift
//  GitHub
//
//  Created by Ana Kresic on 09/08/2021.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = LaunchViewController()
        window?.makeKeyAndVisible()
        return true
    }
}
