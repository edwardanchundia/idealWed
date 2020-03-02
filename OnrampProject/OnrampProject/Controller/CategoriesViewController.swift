//
//  CategoriesViewController.swift
//  OnrampProject
//
//  Created by Edward Anchundia on 3/1/20.
//

import UIKit

class CategoriesViewController: UIViewController {

    let tableView = UITableView()
    
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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
}

extension CategoriesViewController: UITableViewDelegate {
    
}

extension CategoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "testing 1"
        return cell
    }
    
    
}
