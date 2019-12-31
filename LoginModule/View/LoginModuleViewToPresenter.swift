//
//  LoginModuleViewToPresenter.swift
//  LoginModule
//
//  Created by MacBook on 12/30/19.
//  Copyright © 2019 MacBook. All rights reserved.
//

import Foundation

protocol LoginModuleViewToPresenter {
    func willPrepareViews()
    func willAnimateViews()
    func didTapLoginButton(username: String?, password: String?)
}
