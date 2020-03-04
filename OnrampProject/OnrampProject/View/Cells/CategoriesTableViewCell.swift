//
//  CategoriesTableViewCell.swift
//  OnrampProject
//
//  Created by Edward Anchundia on 3/2/20.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {
    
    static let reuseID = "CategoriesCell"
    
    let categoriesImageView = UnsplashImageView(frame: .zero)
    let categoriesLabel = UnsplashLabel(frame: .zero)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell() {
        categoriesLabel.textAlignment = .center
        addSubview(categoriesImageView)
        categoriesImageView.addSubview(categoriesLabel)
        
        let constraints = [
            categoriesImageView.topAnchor.constraint(equalTo: self.topAnchor),
            categoriesImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            categoriesImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            categoriesImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            categoriesLabel.centerYAnchor.constraint(equalTo: categoriesImageView.centerYAnchor),
            categoriesLabel.centerXAnchor.constraint(equalTo: categoriesImageView.centerXAnchor),
            categoriesLabel.heightAnchor.constraint(equalToConstant: 30),
            categoriesLabel.widthAnchor.constraint(equalToConstant: 150),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
