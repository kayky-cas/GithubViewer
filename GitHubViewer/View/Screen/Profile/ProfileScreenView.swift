//
// Created by Kayky Casagrande on 01/02/23.
//

import UIKit

class ProfileScreenView: BaseScreenView {
    var user: User? {
        didSet {
            //TODO
            guard let user = user else {
                return
            }

            nameLabel.text = user.name

            if let avatarUrl = user.avatarUrl {
                avatarImage.downloaded(from: avatarUrl)
            }

            userLabel.text = "@" + user.login

            followersLabel.text = "Followers: \(user.followers)"
            followingLabel.text = "Following \(user.following)"
        }
    }

    let circleBorder = 30.0

    lazy var backCircle = CircleView()
    lazy var frontCircle: CircleView = {
        let circleView = CircleView()

        circleView.layer.borderColor = UIColor.black.cgColor
        circleView.layer.borderWidth = circleBorder / 2

        return circleView
    }()

    lazy var nameLabel: UILabel = {
        let uiLabel = UILabel()

        uiLabel.font = .boldSystemFont(ofSize: 25)
        uiLabel.numberOfLines = 0

        return uiLabel
    }()

    lazy var avatarImage: UIImageView = {
        let uiImageView = UIImageView()

        uiImageView.layer.masksToBounds = true
        uiImageView.layer.cornerRadius = 60
        uiImageView.layer.borderWidth = 3
        uiImageView.layer.borderColor = UIColor.white.cgColor

        return uiImageView
    }()

    lazy var userLabel: UILabel = {
        let uiLabel = UILabel()

        uiLabel.font = .italicSystemFont(ofSize: 18)
        uiLabel.textColor = .gray

        return uiLabel
    }()

    lazy var followersLabel: UILabel = {
        let uiLabel = UILabel()

        uiLabel.font = .systemFont(ofSize: 15)
        uiLabel.textColor = .gray

        return uiLabel
    }()

    lazy var followingLabel: UILabel = {
        let uiLabel = UILabel()

        uiLabel.font = .systemFont(ofSize: 15)
        uiLabel.textColor = .gray

        return uiLabel
    }()

    var reposTableView: UITableView = {
        let uiTableView = UITableView()

        uiTableView.backgroundColor = .init(red: 0, green: 0, blue: 0, alpha: 0.5)
        uiTableView.layer.masksToBounds = true
        uiTableView.layer.cornerRadius = 20
//        uiTableView.layer.borderColor = UIColor.white.cgColor
//        uiTableView.layer.borderWidth = 3

        return uiTableView
    }()

    lazy var container = {
        let view = UIVisualEffectView(effect: nil)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.effect = UIBlurEffect(style: .systemThinMaterialDark)
        view.backgroundColor = .clear

        view.layer.masksToBounds = true
        view.layer.cornerRadius = 20
//        view.layer.borderColor = UIColor.white.cgColor
//        view.layer.borderWidth = 3

        return view
    }()


    override func setup() {
        addSubviews(
                backCircle,
                frontCircle,
                nameLabel,
                avatarImage,
                userLabel,
                followersLabel,
                followingLabel,
                container,
                reposTableView
        )
    }

    override func setupConstraints() {
        let circleSize = 350.0

        backCircle.anchor(
                padding: .init(top: 0, left: 0, bottom: -30, right: 0),
                size: .init(width: circleSize, height: circleSize)
        )

        backCircle.anchorCenterX(to: leadingAnchor)
        backCircle.anchorCenterY(to: bottomAnchor)

        frontCircle.anchor(
                padding: .init(top: 0, left: 0, bottom: -30, right: 0),
                size: .init(width: circleSize - circleBorder, height: circleSize - circleBorder)
        )

        frontCircle.anchorCenterX(to: leadingAnchor)
        frontCircle.anchorCenterY(to: bottomAnchor)

        avatarImage.anchor(
                top: safeAreaLayoutGuide.topAnchor,
                trailing: trailingAnchor,
                padding: .init(top: 0, left: 0, bottom: 0, right: 10),
                size: .init(width: 120, height: 120)
        )

        nameLabel.anchor(
                top: avatarImage.topAnchor,
                leading: safeAreaLayoutGuide.leadingAnchor,
                trailing: centerXAnchor,
                padding: .init(top: 0, left: 10, bottom: 0, right: 0)
        )

        userLabel.anchor(
                top: nameLabel.bottomAnchor,
                leading: nameLabel.leadingAnchor,
                trailing: centerXAnchor
        )

        followersLabel.anchor(
                leading: nameLabel.leadingAnchor,
                bottom: avatarImage.bottomAnchor,
                trailing: centerXAnchor
        )

        followingLabel.anchor(
                bottom: avatarImage.bottomAnchor,
                trailing: nameLabel.trailingAnchor
        )

        reposTableView.anchor(
                top: avatarImage.bottomAnchor,
                leading: nameLabel.leadingAnchor,
                bottom: safeAreaLayoutGuide.bottomAnchor,
                trailing: avatarImage.trailingAnchor,
                padding: .init(top: 20, left: 0, bottom: 0, right: 0)
        )

        container.anchor(
                top: avatarImage.bottomAnchor,
                leading: nameLabel.leadingAnchor,
                bottom: safeAreaLayoutGuide.bottomAnchor,
                trailing: avatarImage.trailingAnchor,
                padding: .init(top: 20, left: 0, bottom: 0, right: 0)
        )
    }
}
