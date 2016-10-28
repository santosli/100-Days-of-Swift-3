//
//  ViewController.swift
//  Project 07
//
//  Created by Santos on 28/10/2016.
//  Copyright © 2016 santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstViewTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressDone(_ sender: AnyObject) {
        let secondViewController = storyboard?.instantiateViewController(withIdentifier: "SLSecondViewController") as! SLSecondViewController
        
        secondViewController.stringPassed = firstViewTextField.text!
        
        navigationController?.pushViewController(secondViewController, animated: true)
    }

}

