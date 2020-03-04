//
//  UnsplashLabel.swift
//  OnrampProject
//
//  Created by Edward Anchundia on 3/4/20.
//

import UIKit

class UnsplashLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
