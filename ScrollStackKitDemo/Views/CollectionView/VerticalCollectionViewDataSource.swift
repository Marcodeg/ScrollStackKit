//
//  VerticalCollectionViewDataSource.swift
//  ScrollStackKitDemo
//
//  Created by Marco Del Giudice on 08/10/21.
//

import UIKit

class VerticalCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    struct VerticalCellData {
        var vehicleName: String
        var minutesText: String
        var percentageText: String
        var vehicleImage: UIImage
    }
    
    private var dataSource: [VerticalCellData] = [
        VerticalCellData(vehicleName: "Scooter",
                         minutesText: "13 min",
                         percentageText: "46%",
                         vehicleImage: "🛵".toImage(withDimension: 120, font: .systemFont(ofSize: 12)) ?? UIImage()),
        VerticalCellData(vehicleName: "Car",
                         minutesText: "18 min",
                         percentageText: "54%",
                         vehicleImage: "🛵".toImage(withDimension: 120, font: .systemFont(ofSize: 12)) ?? UIImage())
        
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VerticalCollectionViewCell", for: indexPath) as? VerticalCollectionViewCell else { return UICollectionViewCell() }
        let data = dataSource[indexPath.item]
        cell.prepareForShow(vehicleName: data.vehicleName,
                            minutesText: data.minutesText,
                            percentageText: data.percentageText,
                            vehicleImage: data.vehicleImage)
        return cell
    }
}
