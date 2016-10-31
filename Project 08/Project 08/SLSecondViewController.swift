//
//  SLSecondViewController.swift
//  Project 08
//
//  Created by Santos on 31/10/2016.
//  Copyright © 2016 santos. All rights reserved.
//

import UIKit

class SLSecondViewController: UIViewController {

    @IBOutlet weak var secondTextFiled: UITextField!
    
    var passedString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        secondTextFiled.text = passedString
        
        //add done button
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
        
        //add gesture recognizer
        let swipeDown = UISwipeGestureRecognizer.init(target: self, action: #selector(self.respondToSwipeGesture(_:)))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDown)
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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
