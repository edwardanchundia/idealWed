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
        
        viewControllers = [createViewerNavigationController()]
    }

    func createViewerNavigationController() -> UINavigationController {
        let viewerController = ViewController()
        viewerController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: viewerController)
    }
}
