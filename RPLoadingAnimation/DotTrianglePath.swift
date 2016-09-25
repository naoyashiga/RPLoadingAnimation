//
//  DotTrianglePath.swift
//  RPLoadingAnimation
//
//  Created by naoyashiga on 2015/10/12.
//  Copyright © 2015年 naoyashiga. All rights reserved.
//

import UIKit

class DotTrianglePath: RPLoadingAnimationDelegate {
    var baseLayer = CALayer()
    var baseSize = CGSize(width: 0, height: 0)
    
    func setup(_ layer: CALayer, size: CGSize, colors: [UIColor]) {
        
        let dotNum: CGFloat = 3
        let diameter: CGFloat = size.width / 15
        let dot = CALayer()
        let duration: CFTimeInterval = 1.3
        
        let frame = CGRect(
            x: (layer.bounds.width - diameter) / 2,
            y: (layer.bounds.height - diameter) / 2,
            width: diameter,
            height: diameter
        )
        
        layer.frame = frame
        baseLayer = layer
        baseSize = size
        
        dot.backgroundColor = colors[0].cgColor
        dot.frame = frame
        dot.cornerRadius = diameter / 2
        
        let replicatorLayer = CAReplicatorLayer()
        
        replicatorLayer.frame = layer.bounds
        replicatorLayer.addSublayer(dot)
        
        replicatorLayer.instanceCount = Int(dotNum)
        replicatorLayer.instanceDelay = CFTimeInterval(-1 / dotNum)
        
        layer.addSublayer(replicatorLayer)
        
        let moveAnimation = CAKeyframeAnimation(keyPath: "position")
        moveAnimation.path = getPath()
        moveAnimation.duration = duration
        moveAnimation.repeatCount = .infinity
        moveAnimation.timingFunction = TimingFunction.easeInOutSine.getTimingFunction()
        dot.add(moveAnimation, forKey: "moveAnimation")
        
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
    
    func getPath() -> CGPath {
        let r: CGFloat = baseSize.width / 5
        let center = CGPoint(x: baseLayer.bounds.width / 2, y: baseLayer.bounds.height / 2)
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: center.x, y: -r))
        path.addLine(to: CGPoint(x: center.x - r, y: r / 2))
        path.addLine(to: CGPoint(x: center.x + r, y: r / 2))
        path.close()
        
        return path.cgPath
    }
}
