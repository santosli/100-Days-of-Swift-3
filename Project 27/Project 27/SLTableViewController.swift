//
//  SLTableViewController.swift
//  Project 27
//
//  Created by Santos on 04/01/2017.
//  Copyright © 2017 santos. All rights reserved.
//

import UIKit

class SLTableViewController: UITableViewController, UISearchResultsUpdating {

//    @IBOutlet weak var searchBar: UISearchBar!
    
    let movieData = ["Mr. Donkey", "Tony and Susan", "The Day Will Come", "The Shawshank Redemption", "Léon", "Farewell My Concubine", "Forrest Gump", "La vita è bella", "Spirited Away", "Schindler's List", "Titanic","Inception", "WALL·E", "3 Idiots", "Les choristes", "Hachi: A Dog's Tale", "The Godfather", "Gone with the Wind", "The Truman Show", "Nuovo Cinema Paradiso"]
    
    var filteredData: [String]!
    
    var searchController: UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Movies"
        
        //set searchbar delegate
//      searchBar.delegate = self
        
        filteredData = movieData
        
        //use searchController
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchController.searchBar
        
        definesPresentationContext = true
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
        return filteredData.count
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        cell.textLabel?.text = filteredData[indexPath.row]
        
     return cell
     }
}

// MARK: - searchBar delegate
//extension SLTableViewController {
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        filteredData = searchText.isEmpty ? movieData : movieData.filter({ (dataSting: String) -> Bool in
//            return dataSting.range(of: searchText, options: .caseInsensitive) != nil
//        })
//        
//        tableView.reloadData()
//    }
//    
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        searchBar.showsCancelButton = true
//    }
//    
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        searchBar.showsCancelButton = false
//        searchBar.text = ""
//        searchBar.resignFirstResponder()
//    }
//    
//}

// MARK: - UISearchResultsUpdating
extension SLTableViewController {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filteredData = searchText.isEmpty ? movieData : movieData.filter({(dataString: String) -> Bool in
                return dataString.range(of: searchText, options: .caseInsensitive) != nil
            })
            
            tableView.reloadData()
        }
    }
}
