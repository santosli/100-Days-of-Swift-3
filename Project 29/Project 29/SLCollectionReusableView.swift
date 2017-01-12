//
//  SLCollectionReusableView.swift
//  Project 29
//
//  Created by Santos on 13/01/2017.
//  Copyright © 2017 santos. All rights reserved.
//

import UIKit

class SLCollectionReusableView: UICollectionReusableView, UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {
    
    let imageCountA = 6
    
    @IBOutlet weak var collecionViewA: UICollectionView!

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageCountA
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCellA", for: indexPath) as! SLCollectionViewCellA
            
            cell.imageViewA.image = UIImage(named: String(indexPath.row) + ".jpg")
            
            return cell
        
    }

        
}
