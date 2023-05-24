//
//  UserViewModel.swift
//  appApiGit
//
//  Created by ti on 17/05/23.
//

import Foundation
import Combine

protocol UserViewViewProtocol {
    var users: PassthroughSubject<[User], Never> { get }
    var errorMessage: PassthroughSubject<String, Never> { get }
    
    func getUsers()
}

final class UserViewModel {
    private let api: Requestable
    private var cancellables = Set<AnyCancellable>()
    
    var users = PassthroughSubject<[User], Never>()
    var errorMessage = PassthroughSubject<String, Never>()
    
    init(api: Requestable = API()) {
        self.api = api
    }
}

// MARK: - Extension
extension UserViewModel: UserViewViewProtocol {
    func getUsers() {
        api.request(.user)
            .sink { completion in
                guard case let .failure(error) = completion else { return }
                self.errorMessage.send(error.message)
            } receiveValue: { users in
                self.users.send(users)
            }
            .store(in: &cancellables)
    }
}
