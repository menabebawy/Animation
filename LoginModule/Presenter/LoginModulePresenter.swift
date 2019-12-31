//
//  LoginModulePresenter.swift
//  LoginModule
//
//  Created by MacBook on 12/30/19.
//  Copyright © 2019 MacBook. All rights reserved.
//

import Foundation

class LoginModulePresenter {
    weak var view: LoginModulePresenterToView!
}

extension LoginModulePresenter: LoginModuleViewToPresenter {
    func willPrepareViews() {
        view.prepareViews()
    }
    
    func willAnimateViews() {
        view.animateViews()
    }
    
    func didTapLoginButton(username: String?, password: String?) {
        view.faileToLoginDueToWrongCredentials()
    }
    
}
