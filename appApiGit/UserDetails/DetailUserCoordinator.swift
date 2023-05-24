//
//  DetailUserCoordinator.swift
//  appApiGit
//
//  Created by Filipe Boeck on 22/05/23.
//

import UIKit

class DetailUserCoordinator: Coordinator {
    private(set) var viewController: UIViewController?
    private(set) var childCoordinator: Coordinator?

    private let user: User

    init(user: User, viewController: UIViewController?) {
        self.user = user
        self.viewController = viewController
    }

    func start() {
        let detailUser = DetailUserViewController()
        detailUser.user = user

        viewController?.present(detailUser, animated: true)
    }
}
