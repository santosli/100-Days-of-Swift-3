//
//  SLCollectionViewController.swift
//  Project 37
//
//  Created by Santos on 25/01/2017.
//  Copyright © 2017 santos. All rights reserved.
//

import UIKit

private let reuseIdentifier = "imageCell"

class SLCollectionViewController: UICollectionViewController {

    let segueIdetifier = "showLargeImage"

    let imageCount = 8
    let width = UIScreen.main.bounds.width
    var sourceCell: UICollectionViewCell?

    override func viewDidLoad() {
        super.viewDidLoad()

        //set up layout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: width/2, height: width/2)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView?.collectionViewLayout = layout
        
        self.navigationController?.delegate = self
    }
 

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return imageCount
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SLImageCollectionViewCell
        
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor(red:0.83, green:0.87, blue:0.92, alpha:1.00).cgColor
        
        cell.imageView.backgroundColor = .white
        cell.imageView.image = UIImage(named: String(indexPath.row + 1) + ".png")
        
        return cell
    }

}

extension SLCollectionViewController: UINavigationControllerDelegate {
    //MARK: - Navigation
    
    //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == segueIdetifier, let destination = segue.destination as? SLImageViewController {
            let cell = sender as! UICollectionViewCell
            let indexPath = self.collectionView!.indexPath(for: cell)
            destination.imageName = String((indexPath?.row)! + 1) + ".png"
            
            sourceCell = cell
        }
    }
    @IBAction func unwindToViewController (sender: UIStoryboardSegue){
        
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return TransitionManager(operation: operation)
    }
    
    
}
