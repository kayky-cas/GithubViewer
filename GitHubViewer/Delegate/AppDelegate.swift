//
//  AppDelegate.swift
//  GitHubViewer
//
//  Created by Kayky Casagrande on 01/02/23.
//
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow? = nil

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        let navigationController = UINavigationController(rootViewController: SearchViewController())

        window?.rootViewController = navigationController

        window?.tintColor = .white
        window?.overrideUserInterfaceStyle = .dark

        window?.makeKeyAndVisible()

        return true
    }
}
