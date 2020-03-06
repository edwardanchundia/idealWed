//
//  CategoriesViewController.swift
//  OnrampProject
//
//  Created by Edward Anchundia on 3/1/20.
//

import UIKit

class CategoriesViewController: UIViewController {

    let tableView = UITableView()
    var viewModel = CategoriesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Categories"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CategoriesTableViewCell.self, forCellReuseIdentifier: CategoriesTableViewCell.reuseID)
    }
    
}

extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesTableViewCell.reuseID, for: indexPath) as! CategoriesTableViewCell
        cell.categoriesLabel.text = Array(viewModel.categories.keys)[indexPath.row]
        cell.categoriesImageView.image = Array(viewModel.categories.values)[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let navVC = tabBarController?.viewControllers![1] as! UINavigationController
        let feedViewController = navVC.topViewController as! FeedViewController
        let keys = Array(viewModel.categories.keys)
        feedViewController.fetchImages(category: keys[indexPath.row])
//        DispatchQueue.main.async {
        tabBarController?.selectedIndex = 1
//            self.navigationController?.show(feedViewController, sender: nil)
//        }
    }
}
