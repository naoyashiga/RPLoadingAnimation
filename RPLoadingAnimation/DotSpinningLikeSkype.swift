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
    
    func setup(_ layer: CALayer, size: CGSize, colors: [UIColor]) {
        
        let dotNum: CGFloat = 8
        let diameter: CGFloat = size.width / 16
        let duration: CFTimeInterval = 2.8
        
        let dot = CALayer()
        let frame = CGRect(
            x: (layer.bounds.width - diameter) / 2 + diameter * 2,
            y: (layer.bounds.height - diameter) / 2,
            width: diameter,
            height: diameter
        )
        
        baseLayer = layer
        baseSize = size
        
        dot.backgroundColor = colors[0].cgColor
        dot.cornerRadius = diameter / 2
        dot.frame = frame
        
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = layer.bounds
        replicatorLayer.instanceCount = Int(dotNum)
        replicatorLayer.instanceDelay = CFTimeInterval(-1 / dotNum * 0.5)
        
//        let angle = (2.0 * M_PI) / Double(replicatorLayer.instanceCount)
//        replicatorLayer.instanceTransform = CATransform3DMakeRotation(CGFloat(angle), 0.0, 0.0, 1.0)
        
        layer.addSublayer(replicatorLayer)
        replicatorLayer.addSublayer(dot)
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.toValue = 0.8
        scaleAnimation.duration = duration
        scaleAnimation.autoreverses = true
        scaleAnimation.repeatCount = .infinity
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        dot.add(scaleAnimation, forKey: "scaleAnimation")
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.toValue = -2.0 * M_PI
        rotationAnimation.duration = duration
        rotationAnimation.repeatCount = .infinity
        rotationAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
//        replicatorLayer.addAnimation(rotationAnimation, forKey: "rotationAnimation")
//        dot.addAnimation(rotationAnimation, forKey: "rotationAnimation")
        
        let moveAnimation = CAKeyframeAnimation(keyPath: "position")
        moveAnimation.beginTime = 1.0
        moveAnimation.path = getPath()
        moveAnimation.duration = duration
        moveAnimation.repeatCount = .infinity
        moveAnimation.timingFunction = TimingFunction.easeInOutCirc.getTimingFunction()
        dot.add(moveAnimation, forKey: "moveAnimation")
        
        layer.transform = CATransform3DMakeRotation(CGFloat(M_PI) / 2, 0, 0, 0)
        
        
        if colors.count > 1 {
            
            var cgColors : [CGColor] = []
            for color in colors {
                cgColors.append(color.cgColor)
            }
            
            let colorAnimation = CAKeyframeAnimation(keyPath: "backgroundColor")
            colorAnimation.values = cgColors
            colorAnimation.duration = 3
            colorAnimation.repeatCount = .infinity
            colorAnimation.autoreverses = true
            dot.add(colorAnimation, forKey: "colorAnimation")
            
        }

        
    }
    
    func getPath() -> CGPath {
        let radius: CGFloat = baseSize.width / 3
        let center : CGPoint = CGPoint(x: (baseSize.width) / 2, y: (baseSize.height) / 2)
        let p = CGMutablePath()
        p.addArc(center: center , radius: radius, startAngle: -CGFloat.pi*2, endAngle: CGFloat.pi*2*3, clockwise: false)
        return p
    }
}
