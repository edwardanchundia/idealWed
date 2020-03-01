//
//  Response.swift
//  OnrampProject
//
//  Created by Edward Anchundia on 3/1/20.
//

import Foundation

struct Response {
    
    fileprivate var data: Data
    
    init(data: Data) {
        self.data = data
    }
    
    func decode<T: Codable>(_ type: T.Type) -> T? {
        let jsonDecoder = JSONDecoder()
        do {
            let response = try jsonDecoder.decode(T.self, from: data)
            return response
        } catch _ {
            return nil
        }
    }
    
}
