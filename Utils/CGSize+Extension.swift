//
//  CGSize+Extension.swift
//  Utils
//
//  Created by MacBook on 12/31/19.
//  Copyright © 2019 MacBook. All rights reserved.
//

import Foundation

public extension CGSize {
    
    public static func square(_ width: CGFloat) -> CGSize {
        return CGSize(width: width, height: width)
    }

}
