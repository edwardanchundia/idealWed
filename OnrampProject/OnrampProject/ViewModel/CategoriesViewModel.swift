//
//  CategoriesViewModel.swift
//  OnrampProject
//
//  Created by Edward Anchundia on 3/3/20.
//

import UIKit

enum Categories: Int {
    case venues = 0
    case engagmentRings
    case dress
    case flowers
    case honeymoon
}

class CategoriesViewModel {
    
    let categories: [String: UIImage] = [
        "Wedding Cakes": UIImage(named: "weddingCake")!,
        "Engagement Rings": UIImage(named: "engagmentRings")!,
        "Bridal Dress": UIImage(named: "weddingDress")!,
        "Wedding Flowers": UIImage(named: "weddingFlowers")!,
        "Honeymoon": UIImage(named: "honeymoon")!
    ]

}
