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
        
        let animation = RotatingCircle()
        let size = CGSize(width: 30, height: 30)
        animation.setup(view.layer, size: size, color: UIColor.blackColor())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension CGPoint {
    public mutating func offset(dx dx: CGFloat, dy: CGFloat) -> CGPoint {
        x += dx
        y += dy
        
        return self
    }
}