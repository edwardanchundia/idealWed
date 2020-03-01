//
//  WeddingImageCollectionViewCell.swift
//  OnrampProject
//
//  Created by Edward Anchundia on 3/1/20.
//

import UIKit

class WeddingImageCell: UICollectionViewCell {
    
    static let reuseID = "WeddingImageCell"
    
    let postImageView = PostImageView(frame: .zero)
    let usernameImageView = PostImageView(frame: .zero)
    let usernameLabel = UILabel(frame: .zero)
    let likeButton = UIButton(frame: .zero)
    
    public var viewModel: WeddingImageCellModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            usernameLabel.text = viewModel.username
            postImageView.downloadImage(fromURL: viewModel.postImageURL)
            usernameImageView.downloadImage(fromURL: viewModel.userImageURL)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configurePostImage()
        configureUserInfo()
        configureLikeButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configurePostImage() {
        addSubview(postImageView)
        let constraints = [
            postImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
    }
    
    func configureUserInfo() {
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameImageView.backgroundColor = .clear
        usernameImageView.isOpaque = false
        usernameImageView.backgroundColor = .black
        addSubview(usernameImageView)
        addSubview(usernameLabel)
        
        let constraints = [
            usernameImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            usernameImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            usernameImageView.widthAnchor.constraint(equalToConstant: 50),
            usernameImageView.heightAnchor.constraint(equalToConstant: 50),
            
            usernameLabel.centerYAnchor.constraint(equalTo: usernameImageView.centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: usernameImageView.trailingAnchor, constant: 10),
            usernameLabel.widthAnchor.constraint(equalToConstant: 150),
            usernameLabel.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func configureLikeButton() {
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.contentVerticalAlignment = .fill
        likeButton.contentHorizontalAlignment = .fill
        likeButton.contentMode = .scaleAspectFit
        likeButton.tintColor = .white
        addSubview(likeButton)
        
        let constraints = [
            likeButton.centerYAnchor.constraint(equalTo: usernameLabel.centerYAnchor),
            likeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            likeButton.heightAnchor.constraint(equalToConstant: 30),
            likeButton.widthAnchor.constraint(equalToConstant: 30)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
