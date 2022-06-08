//
//  AppDelegate.swift
//  SataFood
//
//  Created by abdrahman on 06/06/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow()
        window.rootViewController = UINavigationController(rootViewController: HomeVC())
        window.makeKeyAndVisible()
        self.window = window
        return true
    }

}

