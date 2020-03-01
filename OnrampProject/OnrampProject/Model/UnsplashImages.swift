//
//  UnsplashResponse.swift
//  OnrampProject
//
//  Created by Edward Anchundia on 2/29/20.
//

import Foundation

struct UnsplashImages: Codable {
    let results: [Results]
}

struct Results: Codable {
    let urls: Urls
    let user: User
}

struct Urls: Codable {
    let regularSizeImageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case regularSizeImageUrl = "regular"
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
