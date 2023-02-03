//
// Created by Kayky Casagrande on 01/02/23.
//

import UIKit

struct Repository: Decodable {
    let id: Int
    let name: String
    let language: String?
}


func getLanguageColor(language: String?) -> UIColor {
    switch language {

    case "Lua": return .cyan
    case "Swift": return .systemPink
    case "HTML": return .systemOrange
    case "Java": return .red
    case "JavaScript": return .yellow
    case "TypeScript": return .link
    case "Rust": return .orange
    case "C++": return .systemTeal
    case "CSS": return .cyan
    case "Python": return .systemGreen
    case "Dart": return .blue

    default: return .white
    }
}