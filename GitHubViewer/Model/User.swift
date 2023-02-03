//
// Created by Kayky Casagrande on 01/02/23.
//

import Foundation

struct User: Decodable {
    let id: Int
    let login: String
    let name: String?
    let followers: Int
    let following: Int
    let avatarUrl: String?
}
