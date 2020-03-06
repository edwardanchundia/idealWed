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
            return UIImage(systemName: Images.heartFilled)!
        } else {
            return UIImage(systemName: Images.heartUnFilled)!
        }
    }
    
    func saveObject(action: PersistenceActionType) {
        PersistenceManager.updateWith(favorite: feedImage, actionType: action) { (error) in
            guard let error = error else {
                return
            }
            print(error)
        }
    }
    
    func imageLikedCheck(favorite: Image) -> Bool {
        var liked = false
        PersistenceManager.retrieveFavorites { (result) in
            switch result {
            case .success(let favorites):
                guard !favorites.contains(favorite) else {
                    liked = true
                    return
                }
                liked = false
            case.failure(_):
                return
            }
        }
        //resetDefaults()
        return liked
    }
    
    //For testing
    func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
}
