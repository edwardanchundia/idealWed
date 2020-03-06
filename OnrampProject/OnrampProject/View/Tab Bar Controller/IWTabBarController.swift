//
//  WedTabBarController.swift
//  OnrampProject
//
//  Created by Edward Anchundia on 3/1/20.
//

import UIKit

class IWTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemTeal
        delegate = self
        viewControllers = [
            createCategoriesNavigationController(),
            createFeedNavigationController(),
            createFavoritesNavigationController(),
        ]
    }

    func createFeedNavigationController() -> UINavigationController {
        let viewerController = FeedViewController()
        viewerController.tabBarItem = UITabBarItem(title: "Feed", image: Images.feedTabBarImage, tag: 0)
        return UINavigationController(rootViewController: viewerController)
    }
    
    func createFavoritesNavigationController() -> UINavigationController {
        let favoritesNavigationController = FavoritesViewController()
        favoritesNavigationController.tabBarItem = UITabBarItem(title: "Favorites", image: Images.favoritesTabBarImage, tag: 1)
        return UINavigationController(rootViewController: favoritesNavigationController)
    }
    
    func createCategoriesNavigationController() -> UINavigationController {
        let categoriesNavController = CategoriesViewController()
        categoriesNavController.tabBarItem = UITabBarItem(title: "Categories", image: Images.categoriesTabBarImage, tag: 2)
        return UINavigationController(rootViewController: categoriesNavController)
    }
    
}

extension IWTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let fromView = selectedViewController?.view, let toView = viewController.view else {
            return false
        }
        if fromView != toView {
            UIView.transition(from: fromView, to: toView, duration: 0.3, options: .transitionCrossDissolve, completion: nil)
        }
        return true
    }

}
