//
//  WeddingViewerViewModel.swift
//  OnrampProject
//
//  Created by Edward Anchundia on 3/1/20.
//

import UIKit

class FeedImageCellViewModel {
    
    private var feedImage: Image
    private let index: Int
    
    init(feedImage: Image, index: Int) {
        self.feedImage = feedImage
        self.index = index
    }
    
    var username: String {
        return feedImage.user.username
    }
    
    var postImageURL: String {
        return feedImage.imageURL.regularSize
    }
    
    var userImageURL: String {
        return feedImage.user.profileImage.large
    }
    
    var tagIndex: Int {
        return index
    }
    
    var likeButtonImage: UIImage {
        if imageLikedCheck(favorite: feedImage) {
            return UIImage(systemName: "heart.fill")!
        } else {
            return UIImage(systemName: "heart")!
        }
//        return UIImage(systemName: "heart")!
    }
    
    func saveObject(action: PersistenceActionType) {
        PersistenceManager.updateWith(favorite: feedImage, actionType: action) { (error) in
//            print(error)
        }
    }
    
    func imageLikedCheck(favorite: Image) -> Bool {
        var liked = favorite.liked
        PersistenceManager.retrieveFavorites { (result) in
            switch result {
            case .success(let favorites):
                guard !favorites.contains(favorite) else {
                    liked = true
//                    favorite.liked = true
                    return
                }
//                print(favorites)
                liked = false
//                self.feedImage.liked = false
            case.failure(_):
                return
            }
        }
        //resetDefaults()
        return liked
    }
    
    func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
}
