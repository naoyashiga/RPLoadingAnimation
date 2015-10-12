//
//  SpininngCircle.swift
//  RPLoadingAnimation
//
//  Created by naoyashiga on 2015/10/12.
//  Copyright © 2015年 naoyashiga. All rights reserved.
//

import UIKit

class SpininngCircle: RPLoadingAnimationDelegate {
    
    func setup(layer: CALayer, size: CGSize, color: UIColor) {
        
        let circle = CALayer()
        let frame = CGRect(
            x: (layer.bounds.width - size.width) / 2,
            y: (layer.bounds.height - size.height) / 2,
            width: size.width,
            height: size.height
        )
        
        circle.backgroundColor = color.CGColor
        circle.cornerRadius = size.width / 2
        circle.frame = frame
        
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = layer.bounds
        replicatorLayer.instanceCount = 4
        replicatorLayer.instanceDelay = 0.1
        
        let angle = (2.0 * M_PI) / Double(replicatorLayer.instanceCount)
        
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(CGFloat(angle), 0.0, 0.0, 1.0)
//        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(size.width, 0, 0)
        
        layer.addSublayer(replicatorLayer)
        replicatorLayer.addSublayer(circle)
        
//        let animation = CABasicAnimation(keyPath: "position.y")
//        animation.toValue = frame.origin.y + 50
//        animation.duration = 0.5
//        animation.autoreverses = true
//        animation.repeatCount = .infinity
//        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
//        circle.addAnimation(animation, forKey: "animation")
        
//        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
//        scaleAnimation.toValue = 0.8
//        scaleAnimation.duration = 0.5
//        scaleAnimation.autoreverses = true
//        scaleAnimation.repeatCount = .infinity
//        scaleAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
//        circle.addAnimation(scaleAnimation, forKey: "scaleAnimation")
        
//        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
//        rotationAnimation.toValue = -2.0 * M_PI
//        rotationAnimation.duration = 6.0
//        rotationAnimation.repeatCount = .infinity
//        rotationAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
//        replicatorLayer.addAnimation(rotationAnimation, forKey: "rotationAnimation")
        
        
//        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(size.width * CGFloat(cos(angle)), size.width * CGFloat(sin(angle)), 0)
//        replicatorLayer.transform = CATransform3DMakeTranslation(size.width * CGFloat(cos(angle)), size.width * CGFloat(sin(angle)), 0)
    }
}
