//
//  HomeModulePresenterToView.swift
//  HomeModule
//
//  Created by MacBook on 1/1/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation

protocol HomeModulePresenterToView: class {
    func addNavigationBarImage()
    func addTitle()
    func addLogoutItemButton()
    func moveGradient(gravityX: Double, gravityY: Double)
}
