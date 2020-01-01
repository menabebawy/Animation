//
//  LoginModuleConfigurator.swift
//  LoginModule
//
//  Created by MacBook on 12/30/19.
//  Copyright © 2019 MacBook. All rights reserved.
//

import UIKit

final class LoginModuleConfigurator {
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? LoginModuleViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: LoginModuleViewController) {
        let presenter = LoginModulePresenter()
        presenter.view = viewController
        viewController.viewToPresenterProtocol = presenter
    }

}
