//
//  Endpoint.swift
//  appApiGit
//
//  Created by Filipe Boeck on 18/05/23.
//

import Foundation

enum Endpoint {
    case user
    case userDetails(String)
    
    var baseURL: String {
        "https://api.github.com"
    }
    
    var url: URL {
        var url: URL
        
        switch self {
        case .user:
            url = URL(string: baseURL + "/users")!
        
        case .userDetails(let login):
            url = URL(string: baseURL + "users/\(login)/repos")!
        }
        
        return url
    }
}
