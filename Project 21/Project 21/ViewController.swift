//
//  ViewController.swift
//  Project 21
//
//  Created by Santos on 25/11/2016.
//  Copyright © 2016 santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //init title
        self.navigationItem.title = "date"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func setDate(_ sender: Any) {
        //format date
        let pickerDate = datePicker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d,yyyy"
        
        let dateString = dateFormatter.string(from: pickerDate)
        
        //update UI
        self.navigationItem.title = dateString
    }

}

