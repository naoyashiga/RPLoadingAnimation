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
        
        let size = CGSize(width: 30, height: 30)
        let cellSize = CGSize(width: 100, height: 100)
        
        let animationOrigin = view.center.offset(dx: -cellSize.width / 2, dy: -cellSize.height)
        let animationFrame = CGRect(origin: animationOrigin, size: cellSize)
        let animationView = RPLoadingAnimationView(frame: animationFrame, type: RPLoadingAnimationType.SpininngCircle, color: UIColor.blackColor(), size: size)
        
        view.addSubview(animationView)
        animationView.setupAnimation()
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