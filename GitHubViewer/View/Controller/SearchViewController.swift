//
//  ViewController.swift
//  GitHubViewer
//
//  Created by Kayky Casagrande on 01/02/23.
//
//

import UIKit


class SearchViewController: BaseViewController {
    let searchViewModel = SearchViewModel()

    let searchScreenView = SearchScreenView()

    override func loadView() {
        view = searchScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        searchScreenView.searchButton.addTarget(self, action: #selector(searchUser), for: .touchUpInside)
    }

    @objc func searchUser() {
        searchViewModel.searchUser(username: searchScreenView.usernameTextField.text!, navigationController: navigationController)
    }
}
