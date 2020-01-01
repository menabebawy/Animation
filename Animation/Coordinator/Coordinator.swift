//
//  Coordinator.swift
//  Animation
//
//  Created by MacBook on 12/30/19.
//  Copyright © 2019 MacBook. All rights reserved.
//

import UIKit

protocol Coordinator : class {
    var childCoordinators: [Coordinator] { get set }
    
    init(navigationController: UINavigationController)
    func start()
}
