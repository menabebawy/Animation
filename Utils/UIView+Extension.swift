//
//  UIView+Extension.swift
//  Utils
//
//  Created by MacBook on 12/31/19.
//  Copyright © 2019 MacBook. All rights reserved.
//

import UIKit

public extension UIView {
    var height: CGFloat {
        get {
            return frame.size.height
        } set {
            frame.size.height = newValue
        }
    }
    
    var width: CGFloat {
        get {
            return frame.size.width
        } set {
            frame.size.width = newValue
        }
    }

    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        } set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    func shake(margin: CGFloat, duration: TimeInterval) {
        let keyFrame = CAKeyframeAnimation(keyPath: "position")
        let point = layer.position
        keyFrame.values = [NSValue(cgPoint: CGPoint(x: CGFloat(point.x), y: CGFloat(point.y))),
                           NSValue(cgPoint: CGPoint(x: CGFloat(point.x - margin), y: CGFloat(point.y))),
                           NSValue(cgPoint: CGPoint(x: CGFloat(point.x + margin), y: CGFloat(point.y))),
                           NSValue(cgPoint: CGPoint(x: CGFloat(point.x - margin), y: CGFloat(point.y))),
                           NSValue(cgPoint: CGPoint(x: CGFloat(point.x + margin), y: CGFloat(point.y))),
                           NSValue(cgPoint: CGPoint(x: CGFloat(point.x - margin), y: CGFloat(point.y))),
                           NSValue(cgPoint: CGPoint(x: CGFloat(point.x + margin), y: CGFloat(point.y))),
                           NSValue(cgPoint: point)]
        
        keyFrame.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        keyFrame.duration = duration
        layer.position = point
        layer.add(keyFrame, forKey: keyFrame.keyPath)
        CATransaction.commit()
    }
    
}
