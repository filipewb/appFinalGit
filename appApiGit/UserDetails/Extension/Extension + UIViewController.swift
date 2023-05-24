//
//  Extension + UIViewController.swift
//  appApiGit
//
//  Created by Filipe Boeck on 18/05/23.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        self.present(alert, animated: true)
    }
}
