//
//  ViewController.swift
//  Project 08
//
//  Created by Santos on 28/10/2016.
//  Copyright © 2016 santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let swipeDown = UISwipeGestureRecognizer.init(target: self, action: #selector(self.respondToSwipeGesture(_:)))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDown)
        
        let backButton : UIBarButtonItem = UIBarButtonItem(title: "<", style: .done, target: nil, action: nil)
        
        navigationItem.leftBarButtonItem = backButton

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
                view.endEditing(true)
                break
            default:
                break
            }
        }
    }
}

