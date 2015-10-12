//
//  LineScale.swift
//  RPLoadingAnimation
//
//  Created by naoyashiga on 2015/10/12.
//  Copyright © 2015年 naoyashiga. All rights reserved.
//

import UIKit

class LineScale: RPLoadingAnimationDelegate {
    
    func setup(layer: CALayer, size: CGSize, color: UIColor) {
        
        let lineNum: CGFloat = 4
        let lineWidth: CGFloat = size.width / 5
        let line = CALayer()
        
        let frame = CGRect(
            x: (layer.bounds.width - lineWidth) / 2 - lineWidth * lineNum / 2,
            y: (layer.bounds.height - lineWidth) / 2,
            width: lineWidth,
            height: size.height
        )
        
        line.backgroundColor = color.CGColor
        line.frame = frame
        line.cornerRadius = lineWidth / 2
        
        let replicatorLayer = CAReplicatorLayer()
        
        replicatorLayer.frame = layer.bounds
        replicatorLayer.addSublayer(line)
        
        replicatorLayer.instanceCount = Int(lineNum)
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(lineWidth + 10, 0, 0)
        replicatorLayer.instanceDelay = 0.15
        
        layer.addSublayer(replicatorLayer)
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.y")
        scaleAnimation.toValue = 0.3
        scaleAnimation.duration = 0.6
        scaleAnimation.autoreverses = true
        scaleAnimation.repeatCount = .infinity
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        line.addAnimation(scaleAnimation, forKey: "scaleAnimation")
    }
}

