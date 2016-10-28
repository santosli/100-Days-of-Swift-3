//
//  ViewController.swift
//  Project 06
//
//  Created by Santos on 28/10/2016.
//  Copyright © 2016 santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTimeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.updateCurrentTime()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func refreshTime(_ sender: UIButton) {
        self.updateCurrentTime()
    }

    func updateCurrentTime() {
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "MMM d, yyyy, hh:mm:ss a"
        let currentDate = Date()
        let dateString = dataFormatter.string(from: currentDate)
        
        currentTimeLabel.text = dateString
    }
}

