//
//  DynamicHeightCollectionView.swift
//  ScrollStackKitDemo
//
//  Created by Marco Del Giudice on 29/09/21.
//

import UIKit
class DynamicHeightCollectionView: UICollectionView {
    override func layoutSubviews() {
        super.layoutSubviews()
        if bounds.size != intrinsicContentSize {
            self.invalidateIntrinsicContentSize()
        }
    }
    override var intrinsicContentSize: CGSize {
        return collectionViewLayout.collectionViewContentSize
    }
}
