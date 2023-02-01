//
// Created by Kayky Casagrande on 01/02/23.
//

import UIKit

class CircleView: BaseView {
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = frame.height / 2
        layer.masksToBounds = true
        layer.backgroundColor = UIColor.tintColor.cgColor
    }
}
