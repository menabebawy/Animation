//
//  CGRect+Extension.swift
//  Utils
//
//  Created by MacBook on 12/31/19.
//  Copyright © 2019 MacBook. All rights reserved.
//

import Foundation

extension CGRect {
    var center: CGPoint {
        get {
            return CGPoint(x: self.midX, y: self.midY)
        }
        set {
            self = CGRect(x: newValue.x - width / 2,
                          y: newValue.y - height / 2,
                          width: width,
                          height: height)
        }
    }
    
}
