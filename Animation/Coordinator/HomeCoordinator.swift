//
//  HomeCoordinator.swift
//  Animation
//
//  Created by MacBook on 1/1/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit
import HomeModule

protocol HomeCoordinatorDelegate: class {
    func homeCoordinatorDidPresent(_ coordinator: HomeCoordinator)
}

final class HomeCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    unowned let navigationController: UINavigationController
    weak var delegate: HomeCoordinatorDelegate?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let nibName = String(describing: HomeModuleViewController.self)
        let homeViewController = HomeModuleViewController(nibName: nibName, bundle: .main)
        homeViewController.delegate = self
        homeViewController.transitioningDelegate = navigationController.viewControllers.first! as? UIViewControllerTransitioningDelegate
        homeViewController.modalPresentationStyle = .custom
        let navController = UINavigationController(rootViewController: homeViewController)
        navigationController.present(navController, animated: true, completion: { [weak self] in
            guard let `self` = self else { return }
            self.delegate?.homeCoordinatorDidPresent(self)
        })
    }

}

// MARK: - Home module view controller delegate

extension HomeCoordinator: HomeModuleViewControllerDelegate {
    func homeModuleViewControllerDismiss(_ controller: HomeModuleViewController) {
        navigationController.dismiss(animated: true, completion: nil)
    }
    
}
