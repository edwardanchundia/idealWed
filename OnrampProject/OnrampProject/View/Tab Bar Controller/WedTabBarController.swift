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
        UITabBar.appearance().tintColor = .systemTeal
        viewControllers = [
            createFeedNavigationController(),
            createFavoritesNavigationController(),
            createCategoriesNavigationController()
        ]
    }

    func createFeedNavigationController() -> UINavigationController {
        let viewerController = FeedViewController()
        viewerController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "photo.fill.on.rectangle.fill"), tag: 0)
        return UINavigationController(rootViewController: viewerController)
    }
    
    func createFavoritesNavigationController() -> UINavigationController {
        let favoritesNavigationController = FavoritesViewController()
        favoritesNavigationController.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart.circle"), tag: 1)
        return UINavigationController(rootViewController: favoritesNavigationController)
    }
    
    func createCategoriesNavigationController() -> UINavigationController {
        let categoriesNavController = CategoriesViewController()
        categoriesNavController.tabBarItem = UITabBarItem(title: "Categories", image: UIImage(systemName: "list.dash"), tag: 2)
        return UINavigationController(rootViewController: categoriesNavController)
    }
}
