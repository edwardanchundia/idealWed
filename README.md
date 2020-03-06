# IdealWed
<img src="https://github.com/edwardanchundia/idealWed/blob/master/Images/AppIcon.png" width="320" />
IdealWed is the place where you find inspiration for your next wedding. Whether you are planning it for yourself or a friend, IdealWed is the starting point that will help you imagine the wondrous occasion. This project was specifically made for Onramp.

This project satisfies the requirements with the following:
- 3 ViewController: FeedViewController, FavoritesViewController and CategoriesViewController.
- A wide variety of UIView's was used.
- Used the MVVM architectural pattern.
- Unsplash API was used to receive images.
- Made use of UITableViews, UICollectionViews, UIButtons, UIImages, UILabels, UITabbar.
- Persisted data using UserDefaults to save favorite images.

All UI is done programatically.

<img src="https://github.com/edwardanchundia/idealWed/blob/master/Images/AppDemo.gif" width="320" />

## Exploring MVVM

All of the business logic is done on the ViewModels of each ViewController. For the FeedViewController, the network call is done on FeedViewModel. Since the feed is using a custom collection view cell, a CellViewModel was made to go along the recycling of the cell. The FeedImageCellViewModel updates the UI with the appropriate information sent to the custom cell file.

```swift
class FeedViewModel {

  func getImages(category: String, completion: (() -> Void)?) {
    ...
  }

  func cellViewModel(index: Int) -> FeedImageCellViewModel? {
    ...
  }
}
```

______________________
### FeedViewController

After receiving all the data from the Unsplash API, a collection view is populated with the images and info on the photographer. All images are cached for a better experience. Here you have the option to like an image that gets saved on to FavoritesViewController. To make sure that the user knows they already liked an image, we are checking Userdefaults and filling in the liked button. This is done on the FeedImageCellViewModel which then gets passed to the custom collectionViewCell.

```swift
class FeedImageCellViewModel {

  var likeButtonImage: UIImage {
    if imageLikedCheck(favorite: feedImage) {
      return UIImage(systemName: Images.heartFilled)!
    } else {
      return UIImage(systemName: Images.heartUnFilled)!
    }
  }
    
  func imageLikedCheck(favorite: Image) -> Bool {
    ...
  }
}
```

______________________
### FavoritesViewController

Every imaged that was liked is persisted using UserDefaults. The image is encoded as Data to then get saved as the value of the "favorites" key. The same key is used to retrieve the images and get displayed to a collection view.

```swift
enum PersistenceManager {
    
  static private let defaults = UserDefaults.standard
    
  enum Keys {
      static let favorites = "favorites"
  }
  
  static func retrieveFavorites(completed: @escaping (Result<[Image], ErrorMessages>) -> Void) {
  ...
  }
  
}
```

______________________
### CategoriesViewController

On the selection of a cell, the category title is passed on to the URL constructor.
