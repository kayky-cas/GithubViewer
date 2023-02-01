//
// Created by Kayky Casagrande on 01/02/23.
//

import UIKit

class SearchScreenView: BaseScreenView {
    let circleBorder = 30.0

    lazy var backCircle = CircleView()
    lazy var frontCircle: CircleView = {
        let circleView = CircleView()

        circleView.layer.borderColor = UIColor.black.cgColor
        circleView.layer.borderWidth = circleBorder / 2

        return circleView
    }()

    lazy var githubLogo: UIImageView = {
        let uiImageView = UIImageView()

        uiImageView.image = UIImage(named: "github-logo")
        uiImageView.contentMode = .scaleAspectFit

        return uiImageView
    }()

    lazy var title: UILabel = {
        let uiLabel = UILabel()

        uiLabel.text = "Profile Search"
        uiLabel.font = .boldSystemFont(ofSize: 30)
        uiLabel.textAlignment = .center

        return uiLabel
    }()

    lazy var usernameTextField: BaseTextField = {
        let baseTextField = BaseTextField()

        baseTextField.placeholder = "Enter the Github profile..."
        baseTextField.addTarget(self, action: #selector(handleInputChange), for: .editingChanged)
        baseTextField.autocapitalizationType = .none

        return baseTextField
    }()

    lazy var searchButton: UIButton = {
        let uiButton = UIButton(configuration: .filled())

        uiButton.setTitle("Search", for: .normal)
        uiButton.isEnabled = false

        return uiButton
    }()

    override func setup() {
        addSubviews(backCircle, frontCircle, githubLogo, title, usernameTextField, searchButton)
    }

    override func setupConstraints() {
        let circleSize = 350.0

        backCircle.anchor(
                padding: .init(top: 0, left: 0, bottom: -30, right: 0),
                size: .init(width: circleSize, height: circleSize)
        )

        backCircle.anchorCenterX(to: trailingAnchor)
        backCircle.anchorCenterY(to: bottomAnchor)

        frontCircle.anchor(
                padding: .init(top: 0, left: 0, bottom: -30, right: 0),
                size: .init(width: circleSize - circleBorder, height: circleSize - circleBorder)
        )

        frontCircle.anchorCenterX(to: trailingAnchor)
        frontCircle.anchorCenterY(to: bottomAnchor)

        githubLogo.anchor(
                top: safeAreaLayoutGuide.topAnchor,
                padding: .init(top: -90, left: 0, bottom: 0, right: 0),
                size: .init(width: 400, height: 400)
        )

        githubLogo.anchorCenterX(to: centerXAnchor)

        title.anchor(
                top: githubLogo.bottomAnchor,
                leading: leadingAnchor,
                trailing: trailingAnchor,
                padding: .init(top: -80, left: 0, bottom: 0, right: 0)
        )

        usernameTextField.anchor(
                top: title.bottomAnchor,
                leading: leadingAnchor,
                trailing: trailingAnchor,
                padding: .init(top: 20, left: 30, bottom: 0, right: 30)
        )

        searchButton.anchor(
                top: usernameTextField.bottomAnchor,
                padding: .init(top: 80, left: 0, bottom: 0, right: 0)
        )

        searchButton.anchorCenterX(to: centerXAnchor)
    }

    @objc func handleInputChange() {
        searchButton.isEnabled = usernameTextField.text ?? "" != ""
    }
}
