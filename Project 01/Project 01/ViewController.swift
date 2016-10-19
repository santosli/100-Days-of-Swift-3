//
//  ViewController.swift
//  Project 01
//
//  Created by Santos on 19/10/2016.
//  Copyright © 2016 santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapOnce(_ sender: UIButton) {
        countNumber.text = String(Int(countNumber.text!)! + 1)
        
    }

    @IBAction func resetCountNumber(_ sender: AnyObject) {
        countNumber.text = "0"
    }
}

