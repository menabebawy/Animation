//
//  UIImage+Extension.swift
//  Utils
//
//  Created by MacBook on 1/1/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import UIKit

public extension UIImage {
    
    static func getFrom(gradientLayer:CAGradientLayer) -> UIImage? {
        var gradientImage:UIImage?
        UIGraphicsBeginImageContext(gradientLayer.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            gradientLayer.render(in: context)
            gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: .zero,
                                                                                        resizingMode: .tile)
        }
        UIGraphicsEndImageContext()
        return gradientImage
    }
    
}
