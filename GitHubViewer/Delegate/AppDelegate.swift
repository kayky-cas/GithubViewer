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


        let profileViewController = ProfileViewController()
        profileViewController.setData(user: User(
                id: 1,
                login: "kayky-cas",
                name: "Kayky Belleboni Casagrande",
                followers: 10,
                following: 10,
                avatarUrl: "https://avatars.githubusercontent.com/u/57455569?v=4"
        ), repositories: [
            .init(id: 1, name: "GitHubUsersViewers", language: "Swift"),
            .init(id: 2, name: "Test", language: "Lua")
        ])

//        let rootViewController = profileViewController
        let rootViewController = SearchViewController()

        let navigationController = UINavigationController(rootViewController: rootViewController)

        window?.rootViewController = navigationController

        window?.tintColor = .white
        window?.overrideUserInterfaceStyle = .dark

        window?.makeKeyAndVisible()

        return true
    }
}
