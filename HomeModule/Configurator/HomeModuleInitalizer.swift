//
//  HomeModuleInitalizer.swift
//  HomeModule
//
//  Created by MacBook on 1/1/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

final class HomeModuleInitalizer: NSObject {
    @IBOutlet weak private var homeModuleViewController: HomeModuleViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let configurator = HomeModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: homeModuleViewController)
    }
    
}
