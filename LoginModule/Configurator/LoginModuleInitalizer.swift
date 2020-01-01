//
//  LoginModuleInitalizer.swift
//  LoginModule
//
//  Created by MacBook on 12/30/19.
//  Copyright © 2019 MacBook. All rights reserved.
//

import UIKit

final class LoginModuleInitalizer: NSObject {
    @IBOutlet weak private var loginModuleViewController: LoginModuleViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let configurator = LoginModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: loginModuleViewController)
    }
    
}
