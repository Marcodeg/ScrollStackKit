//
//  HorizontalCollectionViewDataSource.swift
//  ScrollStackKitDemo
//
//  Created by Marco Del Giudice on 08/10/21.
//

import UIKit

class HorizontalCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    struct HorizontalCellData {
        var title: String
        var subtitle: String
        var image: UIImage
    }
    
    private var dataSource: [HorizontalCellData] = [
        HorizontalCellData(title: "Scooter",
                           subtitle: "Scooter",
                           image: "🛵".toImage(withDimension: 120, font: .systemFont(ofSize: 12)) ?? UIImage()),
        HorizontalCellData(title: "Car",
                           subtitle: "Car",
                           image: "🚙".toImage(withDimension: 120, font: .systemFont(ofSize: 12)) ?? UIImage()),
        HorizontalCellData(title: "Bicycle",
                           subtitle: "Bicycle",
                           image: "🚲".toImage(withDimension: 120, font: .systemFont(ofSize: 12)) ?? UIImage())
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalCollectionViewCell", for: indexPath) as? HorizontalCollectionViewCell else { return UICollectionViewCell() }
        let data = dataSource[indexPath.item]
        cell.prepareForShow(title: data.title, subtitle: data.subtitle, image: data.image)
        return cell
    }
}
