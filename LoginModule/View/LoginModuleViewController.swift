//
//  LoginModuleViewController.swift
//  LoginModule
//
//  Created by MacBook on 12/30/19.
//  Copyright © 2019 MacBook. All rights reserved.
//

import UIKit

public class LoginModuleViewController: UIViewController {
    var viewToPresenterProtocol: LoginModuleViewToPresenter!

    override public func viewDidLoad() {
        super.viewDidLoad()
    }


}

// MARK: -

extension LoginModuleViewController: LoginModulePresenterToView {
}
