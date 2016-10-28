//
//  SLSecondViewController.swift
//  Project 07
//
//  Created by Santos on 28/10/2016.
//  Copyright © 2016 santos. All rights reserved.
//

import UIKit

class SLSecondViewController: UIViewController {

    @IBOutlet weak var secondViewTextField: UITextField!
    
    var stringPassed : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = "Second View"
    
        secondViewTextField.text = self.stringPassed
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
