//
// Created by Kayky Casagrande on 01/02/23.
//

import UIKit

class ProfileViewController: BaseViewController {
    let profileScreenView = ProfileScreenView()

    var repositories: [Repository] = []

    override func loadView() {
        view = profileScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        profileScreenView.reposTableView.delegate = self
        profileScreenView.reposTableView.dataSource = self
        profileScreenView.reposTableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.cellId)
    }

    func setData(user: User, repositories: [Repository]) {
        profileScreenView.user = user
        self.repositories = repositories
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        repositories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.cellId, for: indexPath) as! ProfileTableViewCell

        let repository = repositories[indexPath.item]
        cell.setup(repository: repository)

        return cell
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}
