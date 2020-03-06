//
//  ViewModel.swift
//  OnrampProject
//
//  Created by Edward Anchundia on 3/1/20.
//

import Foundation
import UIKit

class FeedViewModel {

    private var feedImages: UnsplashImageFeed?
    var count: Int {
           return feedImages?.images.count ?? 0
       }
    
    func getImages(category: String, completion: (() -> Void)?) {
        NetworkManager.shared.getFeedImages(category: category, type: UnsplashImageFeed.self) { [weak self] result in
            switch result {
            case .success(let images):
                self?.feedImages = images
                completion?()
            case .failure(_):
                break
            }
        }
    }
    
    func cellViewModel(index: Int) -> FeedImageCellViewModel? {
        guard let feedImage = feedImages?.images[index] else { return nil }
        let weddingViewerViewModel = FeedImageCellViewModel(feedImage: feedImage, index: index)
        return weddingViewerViewModel
    }

}
