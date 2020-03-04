//
//  WeddingImageCollectionViewCell.swift
//  OnrampProject
//
//  Created by Edward Anchundia on 3/1/20.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "FeedCell"
    
    let postImageView = UnsplashImageView(frame: .zero)
    let usernameImageView = UnsplashImageView(cornerRadius: 25)
    let usernameLabel = UnsplashLabel(frame: .zero)
    let likeButton = UnSplashButton(frame: .zero)
    
    public var feedCellViewModel: FeedImageCellViewModel? {
        didSet {
            guard let viewModel = feedCellViewModel else { return }
            usernameLabel.text = viewModel.username
            postImageView.downloadImage(fromURL: viewModel.postImageURL)
            usernameImageView.downloadImage(fromURL: viewModel.userImageURL)
            likeButton.setImage(viewModel.likeButtonImage, for: .normal)
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
    
    private func configureUserInfo() {
        usernameLabel.textColor = .systemBackground
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
        likeButton.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
        addSubview(likeButton)
        let constraints = [
            likeButton.centerYAnchor.constraint(equalTo: usernameLabel.centerYAnchor),
            likeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            likeButton.heightAnchor.constraint(equalToConstant: 30),
            likeButton.widthAnchor.constraint(equalToConstant: 30)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func likeButtonPressed() {
        if likeButton.hasImage(named: "heart.fill", for: .normal) {
            feedCellViewModel?.saveObject(action: .remove)
            likeButton.animateButtonTo(systemName: "heart")
        } else {
            feedCellViewModel?.saveObject(action: .add)
            likeButton.animateButtonTo(systemName: "heart.fill")
        }
    }
}
