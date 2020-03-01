//
//  NetworkManager.swift
//  OnrampProject
//
//  Created by Edward Anchundia on 2/29/20.
//

import UIKit

struct UnsplashAPIEndpoint {
    
    fileprivate var url: URL? {
        let key = "zUW4QV5f8c0EVmwEzmQc8F8toSglC2oVwLajwnieX_Y"
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        components.queryItems = [
            URLQueryItem(name: "page", value: "1"),
            URLQueryItem(name: "query", value: "wedding"),
            URLQueryItem(name: "client_id", value: key)
        ]
        return components.url
    }
    
}

class NetworkManager {
    
    static let shared = NetworkManager()
    let endpoint = UnsplashAPIEndpoint()
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getWeddingImages<T: Codable>(type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let endpointURL = endpoint.url else {
            print("no endpoint")
            return
        }
        
        let session = URLSession.shared.dataTask(with: endpointURL) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            //print(error)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                //completion(.failure(error))
                return
            }
            
            guard let data = data else {
                //completion(.failure(error))
                return
            }
            
            let responsE = Response(data: data)
            
            guard let decoded = responsE.decode(type) else {
                return
            }
            
            completion(.success(decoded))
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
