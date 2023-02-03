//
// Created by Kayky Casagrande on 01/02/23.
//

import UIKit

class SearchViewModel {
    let githubApi = GithubApi()

    func searchUser(username: String, navigationController: UINavigationController?) {
        githubApi.getUser(username: username) { user in
            guard let user = user else {
                return
            }

            print(user)

            self.githubApi.getRepos(username: username) { repositories in
                guard let repositories = repositories else {
                    return
                }

                let profileViewController = ProfileViewController()
                profileViewController.setData(user: user, repositories: repositories)

                navigationController?.pushViewController(profileViewController, animated: true)
            }
        }
    }
}
