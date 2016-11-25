//
//  ViewController.swift
//  Project 19
//
//  Created by Santos on 23/11/2016.
//  Copyright © 2016 santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var demoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //add left and right navigation button
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: nil)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
        
        //init color
        self.navigationItem.title = "New Entry"
        self.navigationController?.navigationBar.barTintColor = UIColor(red:0.93, green:0.98, blue:0.96, alpha:1.00)
        
        self.navigationController?.navigationBar.tintColor = UIColor(red:0.00, green:0.73, blue:0.58, alpha:1.00)
        
        //add toolbar above keyboard
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        keyboardToolbar.setBackgroundImage(UIImage(), forToolbarPosition: .any, barMetrics: .default)
        keyboardToolbar.setShadowImage(UIImage(), forToolbarPosition: .any)
        
        let cameraButton = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: nil)
        cameraButton.tintColor = UIColor(red:0.46, green:0.84, blue:0.74, alpha:1.00)
        
        let locationButton = UIBarButtonItem.init(image: #imageLiteral(resourceName: "location"), style: .plain, target: nil, action: nil)
        locationButton.tintColor = UIColor(red:0.46, green:0.84, blue:0.74, alpha:1.00)
        
        keyboardToolbar.items = [cameraButton, locationButton]
        demoTextView.inputAccessoryView = keyboardToolbar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

