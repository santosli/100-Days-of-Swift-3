//
//  ViewController.swift
//  Project 30
//
//  Created by Santos on 17/01/2017.
//  Copyright © 2017 santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var segementControl: UISegmentedControl!
    
    let imageHeaderCount = 6
    let imageCollectionCount = 16
    
    let collectionViewIdentifier = "collectionView"
    let collectionViewHeaderIdentifier = "collectionHeaderView"
    let collectionHeaderIdentifier = "collectionHeader"
    let tableCellIdentifier = "tableCell"
    
    var tableView: UITableView!
    
    let width = UIScreen.main.bounds.width
    let heigth = UIScreen.main.bounds.height

    
    override func viewDidLoad() {
        super.viewDidLoad()

        //init sub collectionview
        initSubCollectionView()
        
        //init sub tableview
        initSubTableView()
    }
    
    func initSubCollectionView() {
        //set delegate
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //set UICollectionViewFlowLayout
        let layoutB: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layoutB.itemSize = CGSize(width: width/3, height: 200)
        layoutB.sectionInset = UIEdgeInsets(top: 15, left: 0, bottom: 10, right: 0)
        layoutB.minimumInteritemSpacing = 0
        layoutB.minimumLineSpacing = 0
        layoutB.headerReferenceSize =  CGSize(width: width, height: 155)
        collectionView?.collectionViewLayout = layoutB
    }
    
    func initSubTableView() {
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: width, height: heigth - 64))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "SLTableViewCell", bundle: nil), forCellReuseIdentifier: tableCellIdentifier)
        tableView.backgroundColor = .black
        self.view.insertSubview(tableView, belowSubview: collectionView)
    }

    @IBAction func goSearch(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func switchView(_ sender: Any) {
        switch (sender as! UISegmentedControl).selectedSegmentIndex {
        case 0:
            self.view.bringSubview(toFront: self.collectionView!)
        case 1:
            self.view.bringSubview(toFront: tableView)
        default:
            self.view.bringSubview(toFront: self.collectionView!)
        }
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return imageCollectionCount
        } else {
            return imageHeaderCount
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewIdentifier, for: indexPath) as! SLCollectionViewCell
            
            let imageName = String(indexPath.row + imageHeaderCount) + ".jpg"
            cell.imageView.image = UIImage(named: imageName)
            cell.nameLabel.text = imageName
            
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewHeaderIdentifier, for: indexPath) as! SLCollectionHeaderViewCell
            
            let imageName = String(indexPath.row) + ".jpg"
            cell.headerImageView.image = UIImage(named: imageName)
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: collectionHeaderIdentifier, for: indexPath) as! SLCollectionReusableView
        
        let collectionHeaderView = header.collectionHeaderView
        
        collectionHeaderView?.dataSource = self;
        collectionHeaderView?.delegate = self;
        
        //set collectionViewA UICollectionViewFlowLayout
        let layoutA: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layoutA.itemSize = CGSize(width: width, height: 155)
        layoutA.minimumInteritemSpacing = 0
        layoutA.minimumLineSpacing = 0
        layoutA.scrollDirection = .horizontal
        collectionHeaderView?.collectionViewLayout = layoutA
        
        return header
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return imageCollectionCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: tableCellIdentifier) as! SLTableViewCell
        
        let imageName = String(indexPath.row + imageHeaderCount) + ".jpg"

        cell.cellNumberLabel.text = String(indexPath.row)
        cell.cellTitleLabel.text = imageName
        cell.cellDetailLabel.text = "This is a detail description..."
        cell.cellImageView?.image = UIImage(named: imageName)
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


extension UIImage {
    func resizeImageWithFactor(scale: CGFloat) -> UIImage {
        let newSize = CGSize(width: size.width/scale, height: size.height/scale)
        
        // Guard newSize is different
        guard self.size != newSize else { return self }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
