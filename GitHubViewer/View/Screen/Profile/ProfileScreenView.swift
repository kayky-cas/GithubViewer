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

            locationLabel.text = user.location
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

    lazy var locationLabel: UILabel = {
        let uiLabel = UILabel()

        uiLabel.font = .systemFont(ofSize: 12)
        uiLabel.textColor = .gray

        return uiLabel
    }()

    override func setup() {
        addSubviews(
                backCircle,
                frontCircle,
                nameLabel,
                avatarImage,
                userLabel,
                locationLabel
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

        locationLabel.anchor(
                leading: nameLabel.leadingAnchor,
                bottom: avatarImage.bottomAnchor,
                trailing: centerXAnchor
        )
    }
}
