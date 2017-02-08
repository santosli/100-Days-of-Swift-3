//
//  SLCollectionLayout.swift
//  Project 39
//
//  Created by Santos on 08/02/2017.
//  Copyright © 2017 santos. All rights reserved.
//

import UIKit

class SLCollectionLayout: UICollectionViewFlowLayout {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.itemSize = CGSize(width: 88, height: 88)
        self.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        self.minimumInteritemSpacing = 0
        self.minimumLineSpacing = 10
        self.scrollDirection = .horizontal
    }
    
}
