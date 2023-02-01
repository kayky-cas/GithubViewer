//
// Created by Kayky Casagrande on 01/02/23.
//

import UIKit

class SearchViewModel {
    let githubApi = GithubApi()

    func searchUser(username: String, navigationController: UINavigationController?) {
        githubApi.getUser(username: username) { user in
            if let user = user {
//                let profileViewController = ProfileViewController()
//                profileViewController.setData(user: user, repositories: [])
////                navigationController?.pushViewController(profileViewController, animated: true)
            }
        }
    }
}
