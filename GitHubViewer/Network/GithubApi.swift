//
// Created by Kayky Casagrande on 01/02/23.
//

import Foundation
import Alamofire

class GithubApi {
    private let baseUrl = "https://api.github.com"

    let decoder = JSONDecoder()

    init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }

    func getUser(username: String, completion: @escaping (User?) -> Void) {
        let url = "\(baseUrl)/users/\(username)"

        AF.request(url).response { response in
            guard let data = response.data else {
                completion(nil)
                return
            }

            let user = try? self.decoder.decode(User.self, from: data)
            completion(user)
        }
    }

    func getUser2(username: String, completion: @escaping (User?) -> Void) {
        test(url: "\(baseUrl)/users/\(username)", completion: completion)
    }

    func getUser2(username: String, completion: @escaping ([Repository]?) -> Void) {
        test(url: "\(baseUrl)/users/\(username)/repos", completion: completion)
    }

    func getRepos(username: String, completion: @escaping ([Repository]?) -> Void) {
        let url = "\(baseUrl)/users/\(username)/repos"

        AF.request(url).response { response in
            guard let data = response.data else {
                completion(nil)
                return
            }

            let repositories = try? self.decoder.decode([Repository].self, from: data)

            completion(repositories)
        }
    }

    func test<T>(url: String, completion: @escaping (T?) -> Void) where T: Decodable {
        DispatchQueue.global(qos: .userInitiated).async {
            guard let baseUrl = URL(string: url) else {
                return
            }
            var request = URLRequest(url: baseUrl)
            request.httpMethod = "GET"

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                let response = response as! HTTPURLResponse

                if response.statusCode < 400 {

                    if let data = data {
                        let jsonDecoder = JSONDecoder()
                        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase

                        let json = try? jsonDecoder.decode(T.self, from: data)
                        completion(json)
                    } else {
                        completion(nil)
                    }
                } else {
                    completion(nil)
                }

            }
            task.resume()

        }
    }
}
