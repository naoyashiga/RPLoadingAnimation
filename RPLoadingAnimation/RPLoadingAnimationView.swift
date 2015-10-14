//
//  RPLoadingAnimationView.swift
//  RPLoadingAnimation
//
//  Created by naoyashiga on 2015/10/11.
//  Copyright © 2015年 naoyashiga. All rights reserved.
//

import UIKit

public enum RPLoadingAnimationType {
    case RotatingCircle, SpininngDot, LineScale, DotTrianglePath,
    DotSpinningLikeSkype, FunnyDotsA
}

class AnimationFactory {
    class func animationForType(type: RPLoadingAnimationType) -> RPLoadingAnimationDelegate {
        switch type {
        case .RotatingCircle:
            return RotatingCircle()
        case .SpininngDot:
            return SpininngDot()
        case .LineScale:
            return LineScale()
        case .DotTrianglePath:
            return DotTrianglePath()
        case .DotSpinningLikeSkype:
            return DotSpinningLikeSkype()
        case .FunnyDotsA:
            return FunnyDotsA()
        }
    }
}

public class RPLoadingAnimationView: UIView {
    private static let defaultType = RPLoadingAnimationType.RotatingCircle
    private static let defaultColor = UIColor.blackColor()
    private static let defaultSize = CGSize(width: 40, height: 40)
    
    private var type: RPLoadingAnimationType
    private var color: UIColor
    private var size: CGSize
    
    required public init?(coder aDecoder: NSCoder) {
        self.type = RPLoadingAnimationView.defaultType
        self.color = RPLoadingAnimationView.defaultColor
        self.size = RPLoadingAnimationView.defaultSize
        super.init(coder: aDecoder)
    }
    
    init(frame: CGRect, type: RPLoadingAnimationType = defaultType, color: UIColor = defaultColor, size: CGSize = defaultSize) {
        self.type = type
        self.color = color
        self.size = size
        super.init(frame: frame)
    }
    
    func setupAnimation() {
        let animation = AnimationFactory.animationForType(type)
        layer.sublayers = nil
        animation.setup(layer, size: size, color: color)
    }
}