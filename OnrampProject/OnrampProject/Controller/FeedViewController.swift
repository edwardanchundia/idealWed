//
//  ViewController.swift
//  OnrampProject
//
//  Created by Giovanni Noa on 2/20/20.
//

import UIKit

class FeedViewController: HorizontalSnappingController {

    var viewModel = FeedViewModel()
    var category = "Wedding"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configureCollectionView()
        fetchImages(category: category)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
        
    }
    
    func configureCollectionView() {
        //collectionView.frame = view.bounds
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: FeedCollectionViewCell.reuseID)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func fetchImages(category: String) {
        collectionView.setContentOffset(.zero, animated: true)
        viewModel.getImages(category: category) {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

}

extension FeedViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}

extension FeedViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.reuseID, for: indexPath) as! FeedCollectionViewCell
        let cellViewModel = viewModel.cellViewModel(index: indexPath.row)
        cell.feedCellViewModel = cellViewModel
        return cell
    }
    
    
    
}
