//
//  HomeModuleConfigurator.swift
//  HomeModule
//
//  Created by MacBook on 1/1/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation

final class HomeModuleConfigurator {
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? HomeModuleViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: HomeModuleViewController) {
        let presenter = HomeModulePresenter()
        presenter.view = viewController
        viewController.viewToPresenterProtocol = presenter
    }
    
}
