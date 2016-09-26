//
//  LineScale.swift
//  RPLoadingAnimation
//
//  Created by naoyashiga on 2015/10/12.
//  Copyright © 2015年 naoyashiga. All rights reserved.
//

import UIKit

class LineScale: RPLoadingAnimationDelegate {
    
    func setup(_ layer: CALayer, size: CGSize, colors: [UIColor]) {
        
        let lineNum: CGFloat = 4
        let lineSize: CGSize = CGSize(width: size.width / 10, height: size.height / 2.5)
        let line = CALayer()
        let duration: CFTimeInterval = 0.6
        
        let frame = CGRect(
            x: (layer.bounds.width - lineSize.width) / 2 - lineSize.width * lineNum / 2,
            y: (layer.bounds.height - lineSize.height) / 2,
            width: lineSize.width,
            height: lineSize.height
        )
        
        line.backgroundColor = colors[0].cgColor
        line.frame = frame
        line.cornerRadius = lineSize.width / 2
        
        let replicatorLayer = CAReplicatorLayer()
        
        replicatorLayer.frame = layer.bounds
        replicatorLayer.addSublayer(line)
        
        replicatorLayer.instanceCount = Int(lineNum)
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(lineSize.width + 10, 0, 0)
        replicatorLayer.instanceDelay = 0.15
        
        layer.addSublayer(replicatorLayer)
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.y")
        scaleAnimation.toValue = 0.3
        scaleAnimation.duration = duration
        scaleAnimation.autoreverses = true
        scaleAnimation.repeatCount = .infinity
        scaleAnimation.timingFunction = TimingFunction.easeInOutCubic.getTimingFunction()
        line.add(scaleAnimation, forKey: "scaleAnimation")
        
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
            line.add(colorAnimation, forKey: "colorAnimation")
            
        }

    }
}
