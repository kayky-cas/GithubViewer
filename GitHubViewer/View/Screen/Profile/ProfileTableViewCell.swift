//
// Created by Kayky Casagrande on 03/02/23.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    static let cellId = "ProfileTableViewCell"


    lazy var languageLabel: LanguageLabel = {
        let uiLabel = LanguageLabel(withInsets: 3, 3, 9, 9)
        uiLabel.font = .systemFont(ofSize: 13)
        uiLabel.textColor = .init(red: 15 / 255, green: 15 / 255, blue: 15 / 255, alpha: 1)
        uiLabel.layer.masksToBounds = true
        uiLabel.layer.cornerRadius = 10
        uiLabel.isHidden = true
        return uiLabel
    }()

    lazy var repoImage: UIImageView = {
        let uiImageView = UIImageView()

        uiImageView.image = UIImage(systemName: "book.closed")
        uiImageView.contentMode = .scaleAspectFit

        return uiImageView
    }()

    func setup(repository: Repository) {
        backgroundColor = .clear
        addSubviews(languageLabel, repoImage)

        textLabel?.text = repository.name
        textLabel?.font = .boldSystemFont(ofSize: 16)

        if let language = repository.language {

            languageLabel.text = language
            languageLabel.backgroundColor = getLanguageColor(language: language)
            languageLabel.isHidden = false
        }


        setupConstraints()
    }

    func setupConstraints() {
        textLabel?.anchor(
//                top: topAnchor,
                leading: leadingAnchor,
                bottom: centerYAnchor,
                padding: .init(top: 0, left: 10, bottom: 2, right: 0)
        )
        languageLabel.anchor(
                top: centerYAnchor,
                leading: textLabel?.leadingAnchor,
                padding: .init(top: 0, left: 0, bottom: 0, right: 0)
        )

        repoImage.anchor(
                trailing: safeAreaLayoutGuide.trailingAnchor,
                padding: .init(top: 0, left: 0, bottom: 0, right: 10),
                size: .init(width: 30, height: 30)
        )

        repoImage.anchorCenterY(to: centerYAnchor)
    }
}