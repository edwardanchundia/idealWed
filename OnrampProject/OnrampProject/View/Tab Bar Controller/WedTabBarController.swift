//
//  WedTabBarController.swift
//  OnrampProject
//
//  Created by Edward Anchundia on 3/1/20.
//

import UIKit

class WedTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createFeedNavigationController(),
            createFavoritesNavigationController(),
            createCategoriesNavigationController()
        ]
    }

    func createFeedNavigationController() -> UINavigationController {
        let viewerController = FeedViewController()
        viewerController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        
        return UINavigationController(rootViewController: viewerController)
    }
    
    func createFavoritesNavigationController() -> UINavigationController {
        let favoritesNavigationController = FavoritesViewController()
        favoritesNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        return UINavigationController(rootViewController: favoritesNavigationController)
    }
    
    func createCategoriesNavigationController() -> UINavigationController {
        let categoriesNavController = CategoriesViewController()
        categoriesNavController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)
        return UINavigationController(rootViewController: categoriesNavController)
    }
}
