//
//  HorizontalSnappingController.swift
//  OnrampProject
//
//  Created by Edward Anchundia on 3/1/20.
//

import UIKit

class HorizontalSnappingController: UICollectionViewController {

    init() {
        let layout = SnappingLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
        collectionView.backgroundColor = .systemBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

class SnappingLayout: UICollectionViewFlowLayout {
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = self.collectionView else {
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        }
        let parent = super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        let itemWidth = collectionView.frame.width
        let itemSpace = itemWidth + minimumInteritemSpacing
        var pageNumber = round(collectionView.contentOffset.x / itemSpace)
        let velocityX = velocity.x
        if velocityX > 0 {
            pageNumber += 1
        } else if velocityX < 0 {
            pageNumber -= 1
        }
        let nearestPageOffSet = pageNumber * itemSpace
        return CGPoint(x: nearestPageOffSet, y: parent.y)
    }

}
