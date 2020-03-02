//
//  WeddingViewerViewModel.swift
//  OnrampProject
//
//  Created by Edward Anchundia on 3/1/20.
//

import UIKit

class WeddingImageCellModel {
    
    private let weddingPost: Images
    
    init(weddingPost: Images) {
        self.weddingPost = weddingPost
    }
    
    var username: String {
        return weddingPost.user.username
    }
    
    var postImageURL: String {
        return weddingPost.imageURL.regularSize
    }
    
    var userImageURL: String {
        return weddingPost.user.profileImage.large
    }
}
