//
// Created by Kayky Casagrande on 01/02/23.
//

import UIKit

class ProfileViewController: BaseViewController {
    let profileScreenView = ProfileScreenView()

    override func loadView() {
        view = profileScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func setData(user: User, repositories: [Repository]) {
        profileScreenView.user = user
    }
}
