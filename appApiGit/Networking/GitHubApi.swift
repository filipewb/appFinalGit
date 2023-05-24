//
//  GitHubApi.swift
//  appApiGit
//
//  Created by ti on 17/05/23.
//

import Foundation
import Combine

protocol Requestable {
    func request<T: Codable>(_ endpoint: Endpoint) -> AnyPublisher<T, ApiError>
}

final class API: Requestable {
    private let urlSession: URLSession
        
        init (urlSession: URLSession = .shared) {
            self.urlSession = urlSession
        }
    
    func request<T: Codable>(_ endpoint: Endpoint) -> AnyPublisher<T, ApiError> {
        return urlSession.dataTaskPublisher(for: endpoint.url)
            .tryMap { data, response -> Data in
                           if let httpResponse: HTTPURLResponse = response as? HTTPURLResponse {
                               guard (200..<300).contains(httpResponse.statusCode) else {
                                   throw ApiError.unknownError(message: "Error response: \(httpResponse.statusCode)")
                               }
                           }
                           return data
                       }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error -> ApiError in
                if let decodingError = error as? DecodingError {
                    let errorMessage = (decodingError as NSError).debugDescription
                    return ApiError.decodingError(message: errorMessage)
                }
                return ApiError.unknownError(message: error.localizedDescription)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

class GitHubAPI {
    func getUsers(endpoint: Endpoint, completion: @escaping ([User]?) -> Void) {
        let urlString = "https://api.github.com/users"
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let users = try decoder.decode([User].self, from: data)
                completion(users)
            } catch {
                print("Error decoding users: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
    
    func getRepositories(login: String,completion: @escaping ([Repo]?) -> Void) {
        let urlString = "https://api.github.com/users/\(login)/repos"
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let repos = try decoder.decode([Repo].self, from: data)
                completion(repos)
            } catch {
                print("Error decoding repos: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
}
