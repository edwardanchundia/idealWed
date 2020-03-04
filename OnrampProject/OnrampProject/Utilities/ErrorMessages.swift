//
//  ErrorMessages.swift
//  OnrampProject
//
//  Created by Edward Anchundia on 3/1/20.
//

import Foundation

enum ErrorMessages: String, Error {
    
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data recieved from the server was invalid. Please try again."
    case unableToFavorite = "There was an error favoriting this post. Please try again."
    case alreadyInFavorites = "You already favorited this post."
    case noEndpoint = "There was no endpoint."
    
}
