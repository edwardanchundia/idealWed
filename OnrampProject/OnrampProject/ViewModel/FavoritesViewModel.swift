//
//  FavoritesViewModel.swift
//  OnrampProject
//
//  Created by Edward Anchundia on 3/3/20.
//

import UIKit

class FavoritesViewModel {
    
    var favorites = [Image]()
    var count: Int {
        return favorites.count
    }
    
    func getFavorites(completion: (() -> Void)?) {
        PersistenceManager.retrieveFavorites { (result) in
            switch result {
            case .success(let favorites):
                self.favorites = favorites
                completion?()
            case .failure(_):
                break
            }
        }
    }
    
}
