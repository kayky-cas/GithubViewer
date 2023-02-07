//
// Created by Kayky Casagrande on 01/02/23.
//

import UIKit

struct Repository: Decodable {
    let id: Int
    let name: String
    let language: String?

    private static let languageMap: [String: UIColor] = [
        "lua": .cyan,
        "swift": .systemPink,
        "html": .systemOrange,
        "java": .red,
        "javascript": .yellow,
        "typescript": .link,
        "rust": .orange,
        "c++": .systemTeal,
        "css": .cyan,
        "python": .systemGreen,
        "dart": .blue,
        "php": .purple
    ]

    func getLanguageColor() -> UIColor {
        Repository.languageMap[language?.lowercased() ?? ""] ?? .white
    }
}

