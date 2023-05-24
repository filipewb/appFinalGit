//
//  Coordinator.swift
//  appApiGit
//
//  Created by Filipe Boeck on 22/05/23.
//

import UIKit

protocol Coordinator: AnyObject {
    var viewController: UIViewController? { get }
    var childCoordinator: Coordinator? { get }
    func start()
}
