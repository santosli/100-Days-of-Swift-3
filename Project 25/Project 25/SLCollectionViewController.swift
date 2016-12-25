//
//  SLCollectionViewController.swift
//  Project 25
//
//  Created by Santos on 25/12/2016.
//  Copyright © 2016 santos. All rights reserved.
//

import UIKit

private let reuseIdentifier = "photoCell"

class SLCollectionViewController: UICollectionViewController {
    
    let imageNameList = ["0.jpg", "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg", "11.jpg", "12.jpg", "13.jpg", "14.jpg", "15.jpg", "16.jpg", "17.jpg", "18.jpg", "19.jpg"]
    
    fileprivate let itemsPerRow: CGFloat = 3
    
    let photoDetailSegueIdentifier = "showPhotoDetailSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //set header
        navigationItem.title = "Photos"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        navigationController?.navigationBar.barTintColor = UIColor(red:0.00, green:0.56, blue:0.96, alpha:1.00)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
        
        //set UICollectionViewFlowLayout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: width / itemsPerRow, height: width / itemsPerRow)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView?.collectionViewLayout = layout
    }
}



// MARK: UICollectionViewDataSource
extension SLCollectionViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNameList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SLCollectionViewCell
        
        // Configure the cell
        let photoImage = UIImage(named: imageNameList[indexPath.row])
        cell.backgroundColor = UIColor.black
        
        cell.photoImageView.image = photoImage
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == photoDetailSegueIdentifier, let destination = segue.destination as? SLPhotoDetailViewController {
            let cell = sender as! UICollectionViewCell
            let indexPath = self.collectionView!.indexPath(for: cell)
            
            destination.imageName = imageNameList[(indexPath?.row)!]
        }
    }
    
}
