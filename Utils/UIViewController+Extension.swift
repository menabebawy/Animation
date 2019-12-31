//
//  UIViewController+Extension.swift
//  Utils
//
//  Created by MacBook on 12/31/19.
//  Copyright © 2019 MacBook. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    func animate(_ animation: @escaping (() -> Void),
                 duration: TimeInterval,
                 delay: TimeInterval = 0.0,
                 options: UIView.AnimationOptions = [],
                 completion: @escaping ((Bool) -> Void) = {_ in }) {
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: options,
                       animations: { animation() },
                       completion: completion)
    }

}
