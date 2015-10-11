//
//  RPLoadingAnimationDelegate.swift
//  RPLoadingAnimation
//
//  Created by naoyashiga on 2015/10/11.
//  Copyright © 2015年 naoyashiga. All rights reserved.
//

import UIKit

protocol RPLoadingAnimationDelegate: class {
    func setup(layer: CALayer, size: CGSize, color: UIColor)
}
