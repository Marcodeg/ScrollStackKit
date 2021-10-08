//
//  HorizontalCollectionViewDelegate.swift
//  ScrollStackKitDemo
//
//  Created by Marco Del Giudice on 08/10/21.
//

import UIKit

class HorizontalCollectionViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private let itemsPerRow: CGFloat = 2.5
    private let sectionInsets = UIEdgeInsets(top: 8, left: 24, bottom: 16, right: 24)
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * 2
        let widthPerItem = (UIScreen.main.bounds.width - paddingSpace) / itemsPerRow
        let heightPerItem = widthPerItem * 0.652
        return CGSize(width: widthPerItem, height: heightPerItem)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
}

