import UIKit
class FirstViewController: UIViewController {
    
//    let names = ["Iphone 11", "Iphone 12 mini", "MacBook Air M1", "AppleTV", "Iphone 5S", "Iphone 6", "Iphone 8", "Iphone XS", "Iphone 13", "Iphone XR"]
//    
//    let images = [UIImage(named: "iphone 11"), UIImage(named: "iphone 11"), UIImage(named: "macbook air m1"), UIImage(named: "apple tv"), UIImage(named: "iphone 5s"), UIImage(named: "iphone 6"), UIImage(named: "iphone 8"), UIImage(named: "iphone xs"), UIImage(named: "iphone 13"), UIImage(named: "iphone xr")]
//    
    let products = ["Iphone 11": UIImage(named: "iphone 11"), "Iphone 12 mini": UIImage(named: "iphone 11"), "MacBook Air M1": UIImage(named: "macbook air m1"), "AppleTV": UIImage(named: "apple tv"), "Iphone 5S": UIImage(named: "iphone 5s"), "Iphone 6": UIImage(named: "iphone 6"), "Iphone 8": UIImage(named: "iphone 8"), "Iphone XS": UIImage(named: "iphone xs"), "Iphone 13": UIImage(named: "iphone 13"), "Iphone XR": UIImage(named: "iphone xr")]
    
    var searchingNames: [String] = []
    var searchingImages: [UIImage] = []
    
    private lazy var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.delegate = self
        return view
    }()
    
    private lazy var collectionProducts: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(ImageCell.self, forCellWithReuseIdentifier: "imageCell")
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .red
        title = "Popular"
        tabBarItem.image = UIImage(systemName: "search")
        setNavBarColor()
        
        layout()
        
        for (key, value) in products {
            searchingNames.append(key)
            searchingImages.append(value!)
        }
    }
    
    func layout() {
        view.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        view.addSubview(collectionProducts)
        collectionProducts.backgroundColor = .lightGray
        collectionProducts.translatesAutoresizingMaskIntoConstraints = false
        collectionProducts.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionProducts.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionProducts.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 0).isActive = true
        collectionProducts.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
    }
}

extension FirstViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchingNames = []
        searchingImages = []

        if searchText == "" {
            searchingNames.removeAll()
            searchingImages.removeAll()
            for (key, value) in products {
                searchingNames.append(key)
                searchingImages.append(value!)
            }
        }
        
        for (key, value) in products {
            if key.contains(searchText) {
                searchingNames.append(key)
                searchingImages.append(value!)
            }
        }

        self.collectionProducts.reloadData()
    }
}

extension FirstViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchingNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCell

        cell.priceLabel.text = searchingNames[indexPath.row]
        cell.image.image = searchingImages[indexPath.row]
        
        return cell
    }
    
    
}

extension FirstViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 210)
    }
}

