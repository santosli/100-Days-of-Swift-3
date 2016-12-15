//
//  SLEntryListTableViewController.swift
//  Project 23
//
//  Created by Santos on 30/11/2016.
//  Copyright © 2016 santos. All rights reserved.
//

import UIKit

class SLEntryListTableViewController: UITableViewController {
    
    var entryList : [SLEntry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addNewEntry))
        
        entryList = SLEntryDB.sharedInstance.getEntrys()
        
        //set tableview
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 130
        
        let tableTitle = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 25))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        let dateString = dateFormatter.string(from: Date())
        tableTitle.text = dateString
        tableTitle.textAlignment = .center
        tableTitle.textColor = UIColor.darkGray
        
        self.tableView.tableHeaderView = tableTitle
        
        //init navigationbar
        self.navigationItem.title = "Timeline"
        self.navigationController?.navigationBar.barTintColor = UIColor(red:0.93, green:0.98, blue:0.96, alpha:1.00)
        
        self.navigationController?.navigationBar.tintColor = UIColor(red:0.00, green:0.73, blue:0.58, alpha:1.00)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        //reload data
        entryList = SLEntryDB.sharedInstance.getEntrys()
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.entryList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! SLEntryTableViewCell

        // Configure the cell...
        cell.entryTextView.text = self.entryList[indexPath.row].text
        
        let entryDate = self.entryList[indexPath.row].date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        let dateString = dateFormatter.string(from: entryDate)
        cell.timeLabel.text = dateString
        
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        cell.entryImageView.image = UIImage(contentsOfFile: documentDirectory + self.entryList[indexPath.row].imagePath!)
            
        cell.locationLabel.text = self.entryList[indexPath.row].location

        return cell
    }
    
    func addNewEntry() {
        let entryDetailViewController = storyboard?.instantiateViewController(withIdentifier: "entryDetail") as! SLEntryDetailViewController
        let newEntry = SLEntryDB.sharedInstance.addEntry(ctext: "", cimagePath: "", clocation: "", cdate: Date())
        
        entryDetailViewController.entry = newEntry!
        
        self.navigationController?.pushViewController(entryDetailViewController, animated: true)
    }
 
//    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 130
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    let segueIdentifier = "showEntryDetailSegue"
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == segueIdentifier, let destination = segue.destination as? SLEntryDetailViewController, let entryIndex = self.tableView.indexPathForSelectedRow?.row {
            destination.entry = entryList[entryIndex]
        }
        
    }
    

}
