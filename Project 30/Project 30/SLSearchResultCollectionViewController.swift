//
//  SLSearchResultCollectionViewController.swift
//  Project 30
//
//  Created by Santos on 19/01/2017.
//  Copyright © 2017 santos. All rights reserved.
//

import UIKit

private let reuseIdentifier = "searchCell"

class SLSearchResultCollectionViewController: UICollectionViewController {
    
    let width = UIScreen.main.bounds.width
    let heigth = UIScreen.main.bounds.height

    let movieData = ["Mr. Donkey", "Tony and Susan", "The Day Will Come", "The Shawshank Redemption", "Léon", "Farewell My Concubine", "Forrest Gump", "La vita è bella", "Spirited Away", "Schindler's List", "Titanic","Inception", "WALL·E", "3 Idiots", "Les choristes", "Hachi: A Dog's Tale"]
    
    var filteredData: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UINib.init(nibName: "SLSearchCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView?.frame = CGRect(x: 0, y: 0, width: width, height: heigth)
        collectionView?.backgroundColor = UIColor(white: 0, alpha: 0.9)
        self.automaticallyAdjustsScrollViewInsets = false
        
        filteredData = movieData
    }
}

// MARK: UICollectionViewDataSource
extension SLSearchResultCollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if filteredData == movieData {
            return 0
        } else {
            return filteredData.count
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SLSearchCollectionViewCell
    
        cell.searchLabel.text = filteredData[indexPath.row]
        
        let imageName = String(indexPath.row + 6) + ".jpg"
        cell.searchImage.image = UIImage(named: imageName)
        
    
        return cell
    }
}

// MARK: UISearchResultsUpdating
extension SLSearchResultCollectionViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        searchController.searchResultsController?.view.isHidden = false

        if let searchText = searchController.searchBar.text {
            filteredData = searchText.isEmpty ? movieData : movieData.filter({(dataString: String) -> Bool in
                return dataString.range(of: searchText, options: .caseInsensitive) != nil
            })
            
            collectionView?.reloadData()
        }
    }
}
