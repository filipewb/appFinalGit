//
//  MainCordinator.swift
//  appApiGit
//
//  Created by Filipe Boeck on 22/05/23.
//

import UIKit

class MainCordinator: Coordinator {
    private(set) var viewController: UIViewController?
    private(set) var childCoordinator: Coordinator?

    var window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let navigation = UINavigationController()
        navigation.isNavigationBarHidden = true

        self.viewController = navigation
        window.rootViewController = viewController
        window.makeKeyAndVisible()


        let coordinator = makeUserListCoordinator()
        childCoordinator = coordinator
        coordinator.start()
    }

    private func makeUserListCoordinator() -> UserListCoordinator {
        let coordinator = UserListCoordinator(viewController: viewController)
        return coordinator
    }
}
