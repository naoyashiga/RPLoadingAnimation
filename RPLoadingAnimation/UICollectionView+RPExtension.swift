//
//  UICollectionView+RPExtension.swift
//  RPLoadingAnimation
//
//  Created by naoyashiga on 2015/10/13.
//  Copyright © 2015年 naoyashiga. All rights reserved.
//

import UIKit

public extension UICollectionView {
    public func applyCellNib(cellNibName: String) {
        register(UINib(nibName: cellNibName, bundle: nil), forCellWithReuseIdentifier: cellNibName)
    }
}
