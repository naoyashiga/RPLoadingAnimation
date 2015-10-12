//
//  DotSpinningLikeSkype.swift
//  RPLoadingAnimation
//
//  Created by naoyashiga on 2015/10/12.
//  Copyright © 2015年 naoyashiga. All rights reserved.
//

import UIKit

class DotSpinningLikeSkype: RPLoadingAnimationDelegate {
    var baseLayer = CALayer()
    var baseSize = CGSize(width: 0, height: 0)
    
    func setup(layer: CALayer, size: CGSize, color: UIColor) {
        
        let dotNum: CGFloat = 10
        let diameter: CGFloat = size.width / 3
        let duration: CFTimeInterval = 2.5
        
        let dot = CALayer()
        let frame = CGRect(
            x: (layer.bounds.width - diameter) / 2 + diameter * 2,
            y: (layer.bounds.height - diameter) / 2,
            width: diameter,
            height: diameter
        )
        
        baseLayer = layer
        baseSize = size
        
        dot.backgroundColor = color.CGColor
        dot.cornerRadius = diameter / 2
        dot.frame = frame
        
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = layer.bounds
        replicatorLayer.instanceCount = Int(dotNum)
        replicatorLayer.instanceDelay = CFTimeInterval(-1 / dotNum)
        
        let angle = (2.0 * M_PI) / Double(replicatorLayer.instanceCount)
        
//        replicatorLayer.instanceTransform = CATransform3DMakeRotation(CGFloat(angle), 0.0, 0.0, 1.0)
        
        layer.addSublayer(replicatorLayer)
        replicatorLayer.addSublayer(dot)
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.toValue = 0.3
        scaleAnimation.duration = duration
        scaleAnimation.autoreverses = true
        scaleAnimation.repeatCount = .infinity
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        dot.addAnimation(scaleAnimation, forKey: "scaleAnimation")
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.toValue = -2.0 * M_PI
        rotationAnimation.duration = duration
        rotationAnimation.repeatCount = .infinity
        rotationAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
//        replicatorLayer.addAnimation(rotationAnimation, forKey: "rotationAnimation")
//        dot.addAnimation(rotationAnimation, forKey: "rotationAnimation")
        
        let moveAnimation = CAKeyframeAnimation(keyPath: "position")
        moveAnimation.path = getPath()
        moveAnimation.duration = duration
        moveAnimation.repeatCount = .infinity
        moveAnimation.timingFunction = TimingFunction.EaseInOut.getTimingFunction()
        dot.addAnimation(moveAnimation, forKey: "moveAnimation")
        
//        layer.transform = CATransform3DMakeRotation(CGFloat(M_PI) / 2, 0, 0, 0)
    }
    
    func getPath() -> CGPath {
        let diameter: CGFloat = baseSize.width * 2
        
        let rect = CGRectMake(-diameter / 4, -diameter / 4, diameter, diameter)
        let p = CGPathCreateWithEllipseInRect(rect, nil)
        return p
    }
}
