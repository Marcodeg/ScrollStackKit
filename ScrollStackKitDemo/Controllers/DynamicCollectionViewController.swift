//
//  HorizontalCollectionViewController.swift
//  ScrollStackKitDemo
//
//  Created by Marco Del Giudice on 29/09/21.
//

import UIKit

class DynamicCollectionViewController: UIViewController {
    
    private var collectionDataSource: UICollectionViewDataSource?
    private var collectionDelegate: (UICollectionViewDelegate & UICollectionViewDelegateFlowLayout)?
    private var scrollDirection: UICollectionView.ScrollDirection = .horizontal
    
    lazy var collectionView : DynamicHeightCollectionView = {
        let collection = DynamicHeightCollectionView(frame: CGRect.zero,
                                                     collectionViewLayout: UICollectionViewFlowLayout.init())
        collection.backgroundColor = .darkGray
        collection.isScrollEnabled = true
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.collectionViewLayout = UICollectionViewFlowLayout()
        collection.delegate = self.collectionDelegate
        collection.dataSource = self.collectionDataSource
        collection.isPagingEnabled = true
        if let layout = collection.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        collection.register(UINib(nibName: "HorizontalCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HorizontalCollectionViewCell")
        return collection
    }()
    
    convenience init(identifier: String,
                     scrollDirection: UICollectionView.ScrollDirection = .horizontal,
                     collectionDataSource: UICollectionViewDataSource,
                     collectionDelegate: UICollectionViewDelegate & UICollectionViewDelegateFlowLayout) {
        self.init(nibName: nil,bundle: nil)
        self.scrollDirection = scrollDirection
        self.collectionDataSource = collectionDataSource
        self.collectionDelegate = collectionDelegate
        collectionView.register(UINib(nibName: identifier, bundle: nil),
                            forCellWithReuseIdentifier: identifier)
    }
        
    override func viewDidLoad() {
        view.backgroundColor = .white
        self.view.addSubview(collectionView)
        NSLayoutConstraint.activate(collectionView.constraintsForAnchoringTo(boundsOf: self.view))
        
    }
}
