//
//  BannerView.swift
//  ScrollStackKitDemo
//
//  Created by Marco Del Giudice on 17/09/21.
//

import UIKit

@IBDesignable
class BannerView: UIView {
    
    private lazy var backgroundImage: UIView = {
        let bgImage = UIView()
        bgImage.backgroundColor = .yellow
        bgImage.layer.cornerRadius = 12;
        bgImage.layer.masksToBounds = true
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        return bgImage
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Get a free discount"
        titleLabel.textColor = .black
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    func setupView() {
    }
    
    func setupHierarchy() {
        addSubview(backgroundImage)
        backgroundImage.addSubview(titleLabel)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 28),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -28),
            backgroundImage.heightAnchor.constraint(equalToConstant: 80),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor),
        ])
    }
    
}
