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
        
        circle.backgroundColor = UIColor.blackColor()
        circle.layer.cornerRadius = 5
        circle.frame.origin = view.center
        circle.frame.size = CGSize(width: 10, height: 10)
        
        view.addSubview(circle)
        
        UIView.animateWithDuration(
            0.5,
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 0,
            options: UIViewAnimationOptions.CurveLinear,
            animations: {
                circle.center.y += 100
                
            }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

