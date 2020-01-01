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
    
    func shrink(
        duration: TimeInterval = 0.1,
        timingFunction: CAMediaTimingFunction = CAMediaTimingFunction(name: .linear),
        completion: @escaping (() -> Void) = {}) {
        let shrinkAnim = CABasicAnimation(keyPath: "bounds.size.width")
        shrinkAnim.fromValue = frame.width
        shrinkAnim.toValue = frame.height
        shrinkAnim.duration = duration
        shrinkAnim.timingFunction = timingFunction
        shrinkAnim.fillMode = .forwards
        shrinkAnim.isRemovedOnCompletion = false
        layer.add(shrinkAnim, forKey: shrinkAnim.keyPath)
    }
    
    func animateToOriginalWidth(
        duration: TimeInterval = 0.1,
        timingFunction: CAMediaTimingFunction = CAMediaTimingFunction(name: .linear),
        completion: @escaping (() -> Void) = {}) {
        animate(from: bounds.height,
                to: bounds.width,
                duration: duration,
                timingFunction: timingFunction,
                completion: completion)
    }
    
    private func animate(from: CGFloat,
                         to: CGFloat,
                         duration: TimeInterval,
                         timingFunction: CAMediaTimingFunction,
                         completion: @escaping (() -> Void) = {}) {
        let animation = CABasicAnimation(keyPath: "bounds.size.width")
        animation.fromValue = (self.bounds.height)
        animation.toValue = (self.bounds.width)
        animation.duration = duration
        animation.timingFunction = timingFunction
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        
        CATransaction.setCompletionBlock {
            completion()
        }
        layer.add(animation, forKey: animation.keyPath)
        
        CATransaction.commit()
    }
    
}
