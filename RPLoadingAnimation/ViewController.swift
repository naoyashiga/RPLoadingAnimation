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
        
        let circle = UIView()
        let radius: CGFloat = 30
        
        circle.backgroundColor = UIColor.blackColor()
        circle.layer.cornerRadius = radius / 2
        circle.clipsToBounds = true
        circle.frame.origin = view.center.offset(dx: -radius / 2, dy: -radius / 2)
        circle.frame.size = CGSize(width: radius, height: radius)
        
        view.addSubview(circle)
        
        UIView.animateWithDuration(
            2.0,
            delay: 0,
            options: [.Repeat, .Autoreverse],
            animations: {
                circle.center.y += 100
                
            }, completion: nil)
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