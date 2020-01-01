//
//  LoginCoordinator.swift
//  Animation
//
//  Created by MacBook on 12/30/19.
//  Copyright © 2019 MacBook. All rights reserved.
//

import UIKit
import LoginModule

final class LoginCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    unowned let navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let nibName = String(describing: LoginModuleViewController.self)
        let loginViewController = LoginModuleViewController(nibName: nibName, bundle: .main)
        loginViewController.delegate = self
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.viewControllers = [loginViewController]
    }

}

// MARK: - Login module view controller delegate

extension LoginCoordinator: LoginModuleViewControllerDelegate {
    func loginModuleViewControllerLoggedIn(_ controller: LoginModuleViewController) {
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        childCoordinators.append(homeCoordinator)
        homeCoordinator.delegate = self
        homeCoordinator.start()
    }
    
}

// MARK: - Home corrdinate delegate

extension LoginCoordinator: HomeCoordinatorDelegate {
    func homeCoordinatorDidPresent(_ coordinator: HomeCoordinator) {
        (navigationController.viewControllers.first as? LoginModuleViewController)?.updateUIAfterGetResponse()
    }
    
}
