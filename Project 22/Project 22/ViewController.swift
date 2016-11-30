//
//  ViewController.swift
//  Project 22
//
//  Created by Santos on 29/11/2016.
//  Copyright © 2016 santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, changeDateAndTimeProtocol {

    @IBOutlet weak var dateTimeLabel: UILabel!
    
    var setDate = Date()
    var setTime = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //updateTime
        updateTime()
            }
    
    func updateTime() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        
        let dateString = dateFormatter.string(from: setDate)
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "h:mm a"
        
        let timeString = timeFormatter.string(from: setTime)
        
        dateTimeLabel.text = dateString + " at " + timeString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let changeDateSegueIdentifier = "changeDateTimeSegue"
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == changeDateSegueIdentifier, let destination = segue.destination as? SLDateAndTimeViewController {
            destination.passedDate = setDate
            destination.passedTime = setTime
            destination.delegate = self
        }
        
    }
    
    func changedDateAndTime(date: Date, time: Date) {
        self.setDate = date
        self.setTime = time
        self.updateTime()
    }

//    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        self.navigationController?.setNavigationBarHidden(false, animated: true)
//    }
//


}

