//
//  UnsplashResponse.swift
//  OnrampProject
//
//  Created by Edward Anchundia on 2/29/20.
//

import Foundation

struct UnsplashImageFeed: Codable, Hashable {
    let images: [Image]
    
    enum CodingKeys: String, CodingKey {
        case images = "results"
    }
}

struct Image: Codable, Hashable {
    let imageURL: ImageURL
    let user: User
    var liked = false
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "urls"
        case user
    }
}

struct ImageURL: Codable, Hashable {
    let regularSize: String
    
    enum CodingKeys: String, CodingKey {
        case regularSize = "regular"
    }
}

struct User: Codable, Hashable {
    let username: String
    let profileImage: ProfileImage
    
    enum CodingKeys: String, CodingKey {
        case username
        case profileImage = "profile_image"
    }
}

struct ProfileImage: Codable, Hashable {
    let large: String
}
