//
//  PreviousCarCollectionViewCell.swift
//  Lamborghini
//
//  Created by mdelgiudice on 22/02/2021.
//

import UIKit

class HorizontalCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    
    var backgroundImage: UIImage = UIImage() {
        didSet {
            self.backgroundImageView.image = backgroundImage
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundImageView.layer.cornerRadius = 14
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .clear
    }
    
    func prepareForShow(title: String, subtitle: String, image: UIImage) {
        titleLabel.text = title
        self.image.image = image
        
    }
    
    override func prepareForReuse() {
        titleLabel.text = nil
        image.image = nil
    }
}

