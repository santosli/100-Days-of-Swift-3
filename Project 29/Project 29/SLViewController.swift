//
//  SLViewController.swift
//  Project 29
//
//  Created by Santos on 12/01/2017.
//  Copyright © 2017 santos. All rights reserved.
//

import UIKit

class SLViewController: UIViewController {
   
//    @IBOutlet weak var collectionViewA: UICollectionView!
    
    @IBOutlet weak var collectionViewB: UICollectionView!
    
    let imageCountA = 6
    let imageCountB = 16

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //init navigationItem
        navigationItem.title = "Movies"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Genres", style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        
        
        //set delegate
        collectionViewB.delegate = self
        collectionViewB.dataSource = self

        let width = UIScreen.main.bounds.width
        
        //set collectionViewA UICollectionViewFlowLayout
        let layoutB: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layoutB.itemSize = CGSize(width: width/3, height: 200)
        layoutB.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        layoutB.minimumInteritemSpacing = 0
        layoutB.minimumLineSpacing = 0
        layoutB.headerReferenceSize =  CGSize(width: width, height: 155)
        collectionViewB?.collectionViewLayout = layoutB
        
    }
}

extension SLViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return imageCountB
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCellB", for: indexPath) as! SLCollectionViewCellB
        
            let imageName = String(indexPath.row + imageCountA) + ".jpg"
            cell.imageViewB.image = UIImage(named: imageName)
            cell.labelB.text = imageName
            
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "imageHeader", for: indexPath) as! SLCollectionReusableView
        
        let collectionViewA = header.collecionViewA
        
        collectionViewA?.dataSource = header;
        collectionViewA?.delegate = header;
        
        //set collectionViewA UICollectionViewFlowLayout
        let layoutA: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        layoutA.itemSize = CGSize(width: width, height: 155)
        layoutA.minimumInteritemSpacing = 0
        layoutA.minimumLineSpacing = 0
        layoutA.scrollDirection = .horizontal
        collectionViewA?.collectionViewLayout = layoutA
        
        return header
    }
}
