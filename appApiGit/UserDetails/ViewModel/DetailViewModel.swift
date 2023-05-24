//
//  DetailViewModel.swift
//  appApiGit
//
//  Created by ti on 17/05/23.
//

import Foundation

class DetailViewModel {
    
    private let api = GitHubAPI()
    private(set) var repos: [Repo] = []
    var onUpdate: (() -> Void)?
    
    func getRepos(login: String) {
        api.getRepositories(login: login) { [weak self] repos in
            self?.repos = repos ?? []
            self?.onUpdate?()
        }
    }
}
