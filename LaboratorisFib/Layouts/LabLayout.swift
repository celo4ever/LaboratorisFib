//
//  Layout.swift
//  LaboratorisFib
//
//  Created by Marcel Costa i Amezquita on 26/04/2020.
//  Copyright © 2020 Marcel Costa i Amezquita. All rights reserved.
//

import UIKit

protocol LaboratorisLayoutDelegate: AnyObject {
  func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat
}
class LabLayout: UICollectionViewLayout {
    // 1
    weak var delegate: LaboratorisLayoutDelegate?

    // 2
    private let numberOfColumns = 2
    private let cellPadding: CGFloat = 6

    // 3
    private var cache: [UICollectionViewLayoutAttributes] = []

    // 4
    private var contentHeight: CGFloat = 0

    private var contentWidth: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        return collectionView.bounds.width
    }

    // 5
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
      
    override func prepare() {
    // 1
    guard cache.isEmpty == true || cache.isEmpty == false,
        let collectionView = collectionView
        else {
            return
        }
    contentHeight = 0
        
    //Array amb el coordenades X per el frame
    var xOffset: [CGFloat] = []
    for column in 0..<numberOfColumns {
        xOffset.append(CGFloat(column) * 122)
    }
  
    var column = 0
    
    let number = collectionView.numberOfItems(inSection: 0)
    // 3
    for item in 0..<number {
        let indexPath = IndexPath(item: item, section: 0)
            
        // 4
        let height = cellPadding * 2 + 128
        let width = cellPadding * 2 + 122
        
        let frame = CGRect(x: xOffset[column],y: cellPadding * 2, width: width,height: height)
        
        let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
        // 5
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        attributes.frame = insetFrame
        if(cache.count < number)
        {cache.append(attributes)}
            
        // 6
        contentHeight = max(contentHeight, frame.maxY)
        xOffset[column] = xOffset[column] + width + cellPadding
            
        column = column < (numberOfColumns - 1) ? (column + 1) : 0
        }
    }
      
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes: [UICollectionViewLayoutAttributes] = []
        
        // Loop through the cache and look for items in the rect
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        return visibleLayoutAttributes
    }
      
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
}
