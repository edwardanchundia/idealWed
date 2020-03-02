//
//  ViewModel.swift
//  OnrampProject
//
//  Created by Edward Anchundia on 3/1/20.
//

import Foundation
import UIKit

class ViewModel {

    private var weddingImages: UnsplashImageFeed?
    
    func getImages(completion: (() -> Void)?) {
        NetworkManager.shared.getWeddingImages(type: UnsplashImageFeed.self) { [weak self] result in
            switch result {
            case .success(let images):
                self?.weddingImages = images
                completion?()
            case .failure(_):
                break
            }
        }
    }
    
    func cellViewModel(index: Int) -> WeddingImageCellModel? {
        guard let weddingImage = weddingImages else { return nil }
        let weddingViewerViewModel = WeddingImageCellModel(weddingPost: weddingImage.images[index])
        return weddingViewerViewModel
    }
    
    var count: Int {
        return weddingImages?.images.count ?? 0
    }
}
