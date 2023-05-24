//
//  User.swift
//  appApiGit
//
//  Created by ti on 17/05/23.
//

import Foundation

struct User: Codable {
    let login: String
    let id: Int
    let avatarURL: String
    
    private enum CodingKeys: String, CodingKey {
        case login, id
        case avatarURL = "avatar_url"
    }
}
