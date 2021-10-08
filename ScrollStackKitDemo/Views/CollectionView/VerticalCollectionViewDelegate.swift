//
//  VerticalCollectionViewDelegate.swift
//  ScrollStackKitDemo
//
//  Created by Marco Del Giudice on 08/10/21.
//

import UIKit

class VerticalCollectionViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private let itemsPerRow: CGFloat = 1
    private let sectionInsets = UIEdgeInsets(top: 8, left: 24, bottom: 16, right: 24)
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * 2
        let widthPerItem = (UIScreen.main.bounds.width - paddingSpace) / itemsPerRow
        return CGSize(width: widthPerItem, height: 200)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
}
