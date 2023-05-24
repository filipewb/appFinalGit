//
//  APIError.swift
//  appApiGit
//
//  Created by Filipe Boeck on 18/05/23.
//

import Foundation

enum ApiError: Error {
    case decodingError(message: String)
    case unknownError(message: String)
    
    var message: String {
        switch self {
        case .decodingError(let message):
            return message
        case .unknownError(let message):
            return message
        }
    }
}
