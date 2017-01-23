//
//  SLSegueTwoViewController.swift
//  Project 33
//
//  Created by Santos on 23/01/2017.
//  Copyright © 2017 santos. All rights reserved.
//

import UIKit

class SLSegueTwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func swipeDown(_ sender: UISwipeGestureRecognizer) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
   
}
