//
//  FavoritesCollectionViewCell.swift
//  OnrampProject
//
//  Created by Edward Anchundia on 3/3/20.
//

import UIKit

class FavoritesCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "FavoritesCell"
    
    var favoriteImageView = PostImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImage() {
        favoriteImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(favoriteImageView)
        
        let constraints = [
            favoriteImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            favoriteImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            favoriteImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            favoriteImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
