//
//  TopCollectionViewController.swift
//  RPLoadingAnimation
//
//  Created by naoyashiga on 2015/10/13.
//  Copyright © 2015年 naoyashiga. All rights reserved.
//

import UIKit

struct TopCollectionReuseId {
    static let cell = "TopCollectionViewCell"
}

class TopCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private var cellWidth:CGFloat = 0.0
    private var cellHeight:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellWidth = view.bounds.width / 2
        cellHeight = view.bounds.width / 2
        
        collectionView?.applyCellNib(cellNibName: TopCollectionReuseId.cell)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(TopCollectionReuseId.cell, forIndexPath: indexPath) as! TopCollectionViewCell
        
        let cellSize = cell.bounds.size
        
//        let animationOrigin = cell.center.offset(dx: -cellSize.width / 2, dy: -cellSize.height / 2)
//        let animationFrame = CGRect(origin: animationOrigin, size: cellSize)
//        let animationFrame = CGRect(origin: cell.center, size: cellSize)
        let animationFrame = CGRect(origin: CGPointZero, size: cellSize)
        
        let animationView = RPLoadingAnimationView(
            frame: animationFrame,
            type: RPLoadingAnimationType.SpininngDot,
            color: UIColor.blackColor(),
            size: cellSize
        )
//        let animationView = UIView()
//        animationView.frame = animationFrame
//        animationView.backgroundColor = UIColor.yellowColor()
        
        cell.addSubview(animationView)
        animationView.setupAnimation()
        
        return cell
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
