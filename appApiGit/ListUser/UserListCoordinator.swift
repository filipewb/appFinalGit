//
//  UserListCoordinator.swift
//  appApiGit
//
//  Created by Filipe Boeck on 22/05/23.
//

import UIKit

class UserListCoordinator: Coordinator {
    private(set) var viewController: UIViewController?
    private(set) var childCoordinator: Coordinator?

    init(viewController: UIViewController?) {
        self.viewController = viewController
    }

    func start() {
        let controller = UserListViewController()
        controller.delegate = self
        (viewController as? UINavigationController)?.pushViewController(controller, animated: true)
    }

    private func makeDetailUserCoordinator(user: User) -> DetailUserCoordinator {
        let coordinator = DetailUserCoordinator(user: user, viewController: viewController)
        return coordinator
    }
}

extension UserListCoordinator: UserListViewControllerDelegate {
    func showUserDetail(_ user: User) {
        let coordinator = makeDetailUserCoordinator(user: user)
        childCoordinator = coordinator
        coordinator.start()
    }
}
