//
//  SpininngDot.swift
//  RPLoadingAnimation
//
//  Created by naoyashiga on 2015/10/12.
//  Copyright © 2015年 naoyashiga. All rights reserved.
//

import UIKit

class SpininngDot: RPLoadingAnimationDelegate {
    
    func setup(_ layer: CALayer, size: CGSize, colors: [UIColor]) {
        
        let dotNum: CGFloat = 10
        let diameter: CGFloat = size.width / 10
        
        let dot = CALayer()
        let frame = CGRect(
            x: (layer.bounds.width - diameter) / 2 + diameter * 2,
            y: (layer.bounds.height - diameter) / 2,
            width: diameter,
            height: diameter
        )
        
        dot.backgroundColor = colors[0].cgColor
        dot.cornerRadius = diameter / 2
        dot.frame = frame
        
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = layer.bounds
        replicatorLayer.instanceCount = Int(dotNum)
        replicatorLayer.instanceDelay = 0.1
        
        let angle = (2.0 * M_PI) / Double(replicatorLayer.instanceCount)
        
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(CGFloat(angle), 0.0, 0.0, 1.0)
        
        layer.addSublayer(replicatorLayer)
        replicatorLayer.addSublayer(dot)
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.toValue = 0.4
        scaleAnimation.duration = 0.5
        scaleAnimation.autoreverses = true
        scaleAnimation.repeatCount = .infinity
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        dot.add(scaleAnimation, forKey: "scaleAnimation")
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.toValue = -2.0 * M_PI
        rotationAnimation.duration = 6.0
        rotationAnimation.repeatCount = .infinity
        rotationAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
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
            dot.add(colorAnimation, forKey: "colorAnimation")
            
        }
        
        
        
        
    }
}
