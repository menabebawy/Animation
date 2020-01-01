//
//  LoginModulePresenter.swift
//  LoginModule
//
//  Created by MacBook on 12/30/19.
//  Copyright © 2019 MacBook. All rights reserved.
//

import Foundation

final class LoginModulePresenter {
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
        view.validateCredentials()
        let isValid = username == "admin" && password == "admin123"
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isValid ? self.view.loggedInSuccessfully() : self.view.faileToLoginDueToWrongCredentials()
        }
    }
    
}
