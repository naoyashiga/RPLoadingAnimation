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
    
    fileprivate var cellWidth:CGFloat = 0.0
    fileprivate var cellHeight:CGFloat = 0.0
    
    var animationTypes: [RPLoadingAnimationType] = [
        .rotatingCircle,
        .spininngDot,
        .lineScale,
        .dotTrianglePath,
        .dotSpinningLikeSkype,
        .funnyDotsA
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellWidth = view.bounds.width / 2
        cellHeight = view.bounds.height / 3
        
        collectionView?.applyCellNib(cellNibName: TopCollectionReuseId.cell)
        
        collectionView?.backgroundColor = UIColor.lightText
        self.view.backgroundColor = UIColor.lightText
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animationTypes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopCollectionReuseId.cell, for: indexPath) as! TopCollectionViewCell
        
        let cellSize = cell.bounds.size
        let animationFrame = CGRect(origin: CGPoint.zero, size: cellSize)
        
        let animationView = RPLoadingAnimationView(
            frame: animationFrame,
            type: animationTypes[(indexPath as NSIndexPath).row],
            colors: [UIColor.red,  .blue,  .orange, .purple],
            size: cellSize
        )
        
        cell.addSubview(animationView)
        animationView.setupAnimation()
        
       
        
        return cell
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
