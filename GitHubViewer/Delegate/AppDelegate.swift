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

//        let rootViewController = SearchViewController()

        let profileViewController = ProfileViewController()
        profileViewController.setData(user: User(
                id: 1,
                login: "kayky-cas",
                name: "Kayky Belleboni Casagrande",
                location: "Porto Alegre - RS, Brazil",
                avatarUrl: "https://avatars.githubusercontent.com/u/57455569?v=4"
        ), repositories: [])

        let rootViewController = profileViewController

        let navigationController = UINavigationController(rootViewController: rootViewController)

        window?.rootViewController = navigationController

        window?.tintColor = .white
        window?.overrideUserInterfaceStyle = .dark

        window?.makeKeyAndVisible()

        return true
    }
}
