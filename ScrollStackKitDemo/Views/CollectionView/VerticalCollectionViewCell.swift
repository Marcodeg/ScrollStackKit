//
//  VerticalCollectionViewCell.swift
//  ScrollStackKitDemo
//
//  Created by Marco Del Giudice on 08/10/21.
//

import UIKit

class VerticalCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var vechileNameLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var buttonBackground: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundImageView.layer.cornerRadius = 12
        buttonBackground.layer.cornerRadius = 12
        // Initialization code
    }
    
    
    func prepareForShow(vehicleName: String, minutesText: String, percentageText: String, vehicleImage: UIImage) {
        vechileNameLabel.text = vehicleName
        minutesLabel.text = minutesText
        percentageLabel.text = percentageText
    }
    

}
