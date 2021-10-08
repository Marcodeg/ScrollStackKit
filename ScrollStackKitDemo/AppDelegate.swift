//
//  AppDelegate.swift
//  ScrollStackKitDemo
//
//  Created by Marco Del Giudice on 10/09/21.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navController = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        return true
    }
}

