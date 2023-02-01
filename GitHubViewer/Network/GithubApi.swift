//
// Created by Kayky Casagrande on 01/02/23.
//

import Foundation
import Alamofire

class GithubApi {
    private let baseUrl = "https://api.github.com"

    func getUser(username: String, completion: @escaping (User?) -> Void) {
        let url = "\(baseUrl)/users/\(username)"

        AF.request(url).response { response in
            guard let data = response.data else {
                completion(nil)
                return
            }

            let decoder = JSONDecoder()

            decoder.keyDecodingStrategy = .convertFromSnakeCase

            do {
                let user = try decoder.decode(User.self, from: response.data!)
                print(user)
                completion(user)
            } catch {
                completion(nil)
            }
        }
    }

    func getRepos(username: String, completion: @escaping ([Repository]?) -> Void) {
        let semaphore = DispatchSemaphore(value: 0)

        var request = URLRequest(url: URL(string: "\(baseUrl)/users/\(username)/repos")!, timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                completion(nil)
                semaphore.signal()
                return
            }

            let decoder = JSONDecoder()

            decoder.keyDecodingStrategy = .convertFromSnakeCase

            do {
                let repositories = try decoder.decode([Repository].self, from: data)
                completion(repositories)
            } catch {
                completion(nil)
            }

            semaphore.signal()
        }

        task.resume()
        semaphore.wait()

    }
}
