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
    let view = UIView()
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
        categoriesLabel.textColor = .white
        view.backgroundColor = .black
        view.alpha = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(categoriesImageView)
        categoriesImageView.addSubview(view)
        categoriesImageView.addSubview(categoriesLabel)
        
        let constraints = [
            categoriesImageView.topAnchor.constraint(equalTo: self.topAnchor),
            categoriesImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            categoriesImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            categoriesImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            view.topAnchor.constraint(equalTo: categoriesImageView.topAnchor),
            view.leadingAnchor.constraint(equalTo: categoriesImageView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: categoriesImageView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: categoriesImageView.bottomAnchor),
            
            categoriesLabel.centerYAnchor.constraint(equalTo: categoriesImageView.centerYAnchor),
            categoriesLabel.centerXAnchor.constraint(equalTo: categoriesImageView.centerXAnchor),
            categoriesLabel.heightAnchor.constraint(equalToConstant: 30),
            categoriesLabel.widthAnchor.constraint(equalToConstant: 150),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
