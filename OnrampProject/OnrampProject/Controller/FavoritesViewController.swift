//
//  FavoritesViewController.swift
//  OnrampProject
//
//  Created by Edward Anchundia on 3/1/20.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var viewModel = FavoritesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavoritesImages()
        //self.collectionView.reloadData()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: FlowLayout.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FavoritesCollectionViewCell.self, forCellWithReuseIdentifier: FavoritesCollectionViewCell.reuseID)
    }
    
    func getFavoritesImages() {
        viewModel.getFavorites {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

extension FavoritesViewController: UICollectionViewDelegate {
    
}

extension FavoritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(viewModel.count)
        return viewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoritesCollectionViewCell.reuseID, for: indexPath) as! FavoritesCollectionViewCell
        let image = viewModel.favorites[indexPath.row].imageURL.regularSize
        cell.favoriteImageView.downloadImage(fromURL: image)
        return cell
    }
    
    
}
