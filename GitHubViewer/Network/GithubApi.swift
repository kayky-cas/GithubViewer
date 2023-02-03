//
// Created by Kayky Casagrande on 01/02/23.
//

import Foundation
import Alamofire

class GithubApi {
    private let baseUrl = "https://api.github.com"

    func getUser(username: String, completion: @escaping (User?) -> Void) {
        let url = "\(baseUrl)/users/\(username)"
        getHttp(url: url, completion: completion)
    }

    func getRepos(username: String, completion: @escaping ([Repository]?) -> Void) {
        let url = "\(baseUrl)/users/\(username)/repos"
        getHttp(url: url, completion: completion)
    }

    func getHttp<T>(url: String, completion: @escaping (T?) -> Void) where T: Decodable {
        AF.request(url).response { response in
            guard let data = response.data else {
                completion(nil)
                return
            }

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            let model = try? decoder.decode(T.self, from: data)

            completion(model)
        }
    }
}
