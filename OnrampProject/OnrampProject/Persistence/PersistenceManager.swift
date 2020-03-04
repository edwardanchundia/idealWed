//
//  PersistenceManager.swift
//  OnrampProject
//
//  Created by Edward Anchundia on 3/3/20.
//

import UIKit

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    static func updateWith(favorite: Image, actionType: PersistenceActionType, completion: @escaping (ErrorMessages?) -> Void) {
        retrieveFavorites { (result) in
            switch result {
            case .success(var favorites):
                switch actionType {
                case .add:
                    guard !favorites.contains(favorite) else {
                        completion(.alreadyInFavorites)
                        return
                    }
                    favorites.append(favorite)
                case .remove:
                    favorites.removeAll {
                        $0 == favorite
                    }
                }
                
                completion(save(favorites: favorites))
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    static func retrieveFavorites(completed: @escaping (Result<[Image], ErrorMessages>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        let decoder = Response(data: favoritesData)
        guard let favorites = decoder.decode([Image].self) else {
            completed(.failure(.unableToFavorite))
            return
        }
        completed(.success(favorites))
    }
    
    static func save(favorites: [Image]) -> ErrorMessages? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
    
}
