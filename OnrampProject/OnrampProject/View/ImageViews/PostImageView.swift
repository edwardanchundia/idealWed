//
//  UsernameImageView.swift
//  OnrampProject
//
//  Created by Edward Anchundia on 3/1/20.
//

import UIKit

class PostImageView: UIImageView {

    let cache = NetworkManager.shared.cache

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(cornerRadius: CGFloat) {
        self.init(frame: .zero)
        self.layer.cornerRadius = cornerRadius
    }
    
    private func configure() {
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .scaleAspectFill
        
    }
    
    func downloadImage(fromURL url: String) {
        NetworkManager.shared.downloadImage(from: url) { [weak self] (image) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }

}
