//
//  ViewController.swift
//  RPLoadingAnimation
//
//  Created by naoyashiga on 2015/10/11.
//  Copyright © 2015年 naoyashiga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let circle = UIView()
        let circle = CALayer()
        let radius: CGFloat = 30
        
        circle.backgroundColor = UIColor.blackColor().CGColor
        circle.cornerRadius = radius / 2
        circle.frame.origin = view.center.offset(dx: -radius / 2, dy: -radius / 2)
        circle.frame.size = CGSize(width: radius, height: radius)
        
//        view.addSubview(circle)
        
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = view.bounds
        view.layer.addSublayer(replicatorLayer)
        
        replicatorLayer.addSublayer(circle)
        replicatorLayer.instanceCount = 4
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(20, 0, 0)
        
        
        let animation = CABasicAnimation(keyPath: "position.y")
        animation.toValue = view.center.y + 20
        animation.duration = 0.5
        animation.autoreverses = true
        animation.repeatCount = .infinity
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        circle.addAnimation(animation, forKey: "animation")
        
        replicatorLayer.instanceDelay = 0.1
//        UIView.animateWithDuration(
//            2.0,
//            delay: 0,
//            options: [.Repeat, .Autoreverse],
//            animations: {
//                circle.center.y += 100
//                
//            }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CGPoint {
    public mutating func offset(dx dx: CGFloat, dy: CGFloat) -> CGPoint {
        x += dx
        y += dy
        
        return self
    }
}