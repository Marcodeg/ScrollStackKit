//
//  ViewController.swift
//  ScrollStackKitDemo
//
//  Created by Marco Del Giudice on 10/09/21.
//

import UIKit
import ScrollStackKit

class ViewController: UIViewController {
    
    private lazy var scrollStack: ScrollStackView = {
        let scrollStack = ScrollStackView()
        scrollStack.translatesAutoresizingMaskIntoConstraints = false
        scrollStack.backgroundColor = .darkGray
        return scrollStack
    }()
    
    lazy var horizontalCollectionViewController: DynamicCollectionViewController = {
        let vc = DynamicCollectionViewController(identifier: "HorizontalCollectionViewCell",
                                                 collectionDataSource: HorizontalCollectionViewDataSource(),
                                                 collectionDelegate: HorizontalCollectionViewDelegate())
        return vc
    }()
    
    lazy var verticalCollectionViewController: DynamicCollectionViewController = {
        let vc = DynamicCollectionViewController(identifier: "VerticalCollectionViewCell",
                                                 scrollDirection: .vertical,
                                                 collectionDataSource: VerticalCollectionViewDataSource(),
                                                 collectionDelegate: VerticalCollectionViewDelegate())
        vc.collectionView.isScrollEnabled = false
        return vc
    }()
    
    private lazy var bannerView: BannerView = {
        let banner = BannerView()
        banner.translatesAutoresizingMaskIntoConstraints = false
        return banner
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
        setupLayout()
        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .automatic
        title = "Scroll Stack Demo"

        
        //Add View to ScrollStack
        scrollStack.insertRow(horizontalCollectionViewController, withFixedHeight: 150)
        scrollStack.insertRow(BannerView(), spacing: 32)
        scrollStack.insertRow(verticalCollectionViewController, withFixedHeight: 460)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.verticalCollectionViewController.view.isHidden = true
        }
    }
    
    private func setupSubviews() {
        view.addSubview(scrollStack)
    }
    
    private func setupLayout() {
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            scrollStack.topAnchor.constraint(equalTo: margins.topAnchor),
            scrollStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollStack.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
}

