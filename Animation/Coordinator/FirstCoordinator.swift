//
//  FirstCoordinator.swift
//  Animation
//
//  Created by MacBook on 12/30/19.
//  Copyright © 2019 MacBook. All rights reserved.
//

import UIKit
import LoginModule

class FirstCoordinator {
    var childCoordinators: [Coordinator] = []
    unowned let navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let nibName = String(describing: LoginModuleViewController.self)
        let loginViewController = LoginModuleViewController(nibName: nibName, bundle: .main)
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.viewControllers = [loginViewController]
    }

}
