//
//  SLImageViewController.swift
//  Project 37
//
//  Created by Santos on 25/01/2017.
//  Copyright © 2017 santos. All rights reserved.
//

import UIKit

class SLImageViewController: UIViewController {
    
    var imageName: String!

    @IBOutlet weak var largeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        largeImageView.image = UIImage(named: imageName)

    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
