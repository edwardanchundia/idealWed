//
//  NetworkManager.swift
//  OnrampProject
//
//  Created by Edward Anchundia on 2/29/20.
//

import UIKit

struct UnsplashAPIEndpoint {
    
    fileprivate func addQueryToEndpoint(query: String) -> URL? {
        let key = "zUW4QV5f8c0EVmwEzmQc8F8toSglC2oVwLajwnieX_Y"
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        components.queryItems = [
            URLQueryItem(name: "page", value: "1"),
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "client_id", value: key),
            URLQueryItem(name: "orientation", value: "portrait"),
            URLQueryItem(name: "per_page", value: "50")
        ]
        return components.url
    }
    
}

class NetworkManager {
    
    static let shared = NetworkManager()
    let endpoint = UnsplashAPIEndpoint()
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getFeedImages<T: Codable>(category: String = "Wedding", type: T.Type, completion: @escaping (Result<T, ErrorMessages>) -> Void) {
        guard let endpointURL = endpoint.addQueryToEndpoint(query: category) else {
            completion(.failure(.noEndpoint))
            return
        }
        
        let session = URLSession.shared.dataTask(with: endpointURL) { (data, response, error) in
            if let error = error {
                print(error)
                completion(.failure(.unableToComplete))
                return
            }
    
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            let decoder = Response(data: data)
            guard let feedImages = decoder.decode(type) else {
                completion(.failure(.invalidData))
                return
            }
            
            completion(.success(feedImages))
        }
        
        session.resume()
    }
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self](data, response, error) in
            guard let self = self,
                error == nil,
                let response = response as? HTTPURLResponse, response.statusCode == 200,
                let data = data,
                let image = UIImage(data: data) else {
                    completed(nil)
                    return
            }
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
    
}
