//
//  UnsplashResponse.swift
//  OnrampProject
//
//  Created by Edward Anchundia on 2/29/20.
//

import Foundation

struct UnsplashImageFeed: Codable {
    let images: [Images]
    
    enum CodingKeys: String, CodingKey {
        case images = "results"
    }
}

struct Images: Codable {
    let imageURL: ImageURL
    let user: User
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "urls"
        case user
    }
}

struct ImageURL: Codable {
    let regularSize: String
    
    enum CodingKeys: String, CodingKey {
        case regularSize = "regular"
    }
}

struct User: Codable {
    let username: String
    let profileImage: ProfileImage
    
    enum CodingKeys: String, CodingKey {
        case username
        case profileImage = "profile_image"
    }
}

struct ProfileImage: Codable {
    let large: String
}
