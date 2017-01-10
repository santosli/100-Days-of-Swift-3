//
//  SLTableViewController.swift
//  Project 28
//
//  Created by Santos on 05/01/2017.
//  Copyright © 2017 santos. All rights reserved.
//

import UIKit

class SLTableViewController: UITableViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let imageCount = 6;
    
    let movieData = ["Mr. Donkey", "Tony and Susan", "The Day Will Come", "The Shawshank Redemption", "Léon", "Farewell My Concubine", "Forrest Gump", "La vita è bella", "Spirited Away", "Schindler's List", "Titanic","Inception", "WALL·E", "3 Idiots", "Les choristes", "Hachi: A Dog's Tale", "The Godfather", "Gone with the Wind", "The Truman Show", "Nuovo Cinema Paradiso"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //init navigationItem
        navigationItem.title = "Movies"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Genres", style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //set UICollectionViewFlowLayout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: width, height: 154)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        collectionView?.collectionViewLayout = layout
        
        collectionView.reloadData()

        }

}

// MARK: - Table view data source
extension SLTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movieData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieTable", for: indexPath)

        cell.textLabel?.text = movieData[indexPath.row]

        return cell
    }
}

extension SLTableViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! SLImageCollectionViewCell
        
        cell.imageView.image = UIImage(named: String(indexPath.row) + ".jpg")
        
        return cell
    }
}
