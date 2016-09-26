//
//  RotatingCircle.swift
//  RPLoadingAnimation
//
//  Created by naoyashiga on 2015/10/11.
//  Copyright © 2015年 naoyashiga. All rights reserved.
//

import UIKit

class RotatingCircle: RPLoadingAnimationDelegate {
    
    func setup(_ layer: CALayer, size: CGSize, colors: [UIColor]) {
        
        let dotNum: CGFloat = 4
        let diameter: CGFloat = size.width / 10
        
        let circle = CALayer()
        let frame = CGRect(
            x: (layer.bounds.width - diameter) / 2,
            y: (layer.bounds.height - diameter) / 2,
            width: diameter,
            height: diameter
        )
        
        circle.backgroundColor = colors[0].cgColor
        circle.cornerRadius = diameter / 2
        circle.frame = frame
        
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = layer.bounds
        layer.addSublayer(replicatorLayer)
        
        replicatorLayer.addSublayer(circle)
        replicatorLayer.instanceCount = Int(dotNum)
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(20, 0, 0)
        
        let animation = CABasicAnimation(keyPath: "position.y")
        animation.toValue = frame.origin.y + 50
        animation.duration = 0.5
        animation.autoreverses = true
        animation.repeatCount = .infinity
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        circle.add(animation, forKey: "animation")
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.toValue = 0.8
        scaleAnimation.duration = 0.5
        scaleAnimation.autoreverses = true
        scaleAnimation.repeatCount = .infinity
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        circle.add(scaleAnimation, forKey: "scaleAnimation")
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.toValue = -2.0 * M_PI
        rotationAnimation.duration = 6.0
        rotationAnimation.repeatCount = .infinity
        rotationAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        replicatorLayer.add(rotationAnimation, forKey: "rotationAnimation")
        
        
        if colors.count > 1 {
        
            var cgColors : [CGColor] = []
            for color in colors {
                cgColors.append(color.cgColor)
            }
            
            let colorAnimation = CAKeyframeAnimation(keyPath: "backgroundColor")
            colorAnimation.values = cgColors
            colorAnimation.duration = 2
            colorAnimation.repeatCount = .infinity
            colorAnimation.autoreverses = true
            circle.add(colorAnimation, forKey: "colorAnimation")
        }
        
        
        
        replicatorLayer.instanceDelay = 0.1
        
        let angle = (2.0 * M_PI) / Double(replicatorLayer.instanceCount)
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(CGFloat(angle), 0.0, 0.0, 1.0)
    }
}
