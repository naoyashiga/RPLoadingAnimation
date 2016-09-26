//
//  RPLoadingAnimationView.swift
//  RPLoadingAnimation
//
//  Created by naoyashiga on 2015/10/11.
//  Copyright © 2015年 naoyashiga. All rights reserved.
//

import UIKit

public enum RPLoadingAnimationType {
    case rotatingCircle, spininngDot, lineScale, dotTrianglePath,
    dotSpinningLikeSkype, funnyDotsA
}

class AnimationFactory {
    class func animationForType(_ type: RPLoadingAnimationType) -> RPLoadingAnimationDelegate {
        switch type {
        case .rotatingCircle:
            return RotatingCircle()
        case .spininngDot:
            return SpininngDot()
        case .lineScale:
            return LineScale()
        case .dotTrianglePath:
            return DotTrianglePath()
        case .dotSpinningLikeSkype:
            return DotSpinningLikeSkype()
        case .funnyDotsA:
            return FunnyDotsA()
        }
    }
}

open class RPLoadingAnimationView: UIView {
    fileprivate static let defaultType = RPLoadingAnimationType.rotatingCircle
    fileprivate static let defaultColors = [UIColor.black]
    fileprivate static let defaultSize = CGSize(width: 40, height: 40)
    
    fileprivate var type: RPLoadingAnimationType
    fileprivate var colors: [UIColor]
    fileprivate var size: CGSize
    
    required public init?(coder aDecoder: NSCoder) {
        self.type = RPLoadingAnimationView.defaultType
        self.colors = RPLoadingAnimationView.defaultColors
        self.size = RPLoadingAnimationView.defaultSize
        super.init(coder: aDecoder)
    }
    
    init(frame: CGRect, type: RPLoadingAnimationType = defaultType, colors: [UIColor] = defaultColors, size: CGSize = defaultSize) {
        self.type = type
        self.colors = colors
        self.size = size
        super.init(frame: frame)
    }
    
    func setupAnimation() {
        let animation = AnimationFactory.animationForType(type)
        layer.sublayers = nil
        animation.setup(layer, size: size, colors: colors)
    }
}
