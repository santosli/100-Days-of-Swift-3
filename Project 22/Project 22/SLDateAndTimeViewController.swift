//
//  SLDateAndTimeViewController.swift
//  Project 22
//
//  Created by Santos on 29/11/2016.
//  Copyright © 2016 santos. All rights reserved.
//

import UIKit

protocol changeDateAndTimeProtocol {
    func changedDateAndTime(date:Date, time:Date)
}

class SLDateAndTimeViewController: UIViewController {
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var timePicker: UIDatePicker!
    
    var delegate : changeDateAndTimeProtocol?
    var passedDate = Date()
    var passedTime = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //create navigationbar
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 60))
        self.view.addSubview(navBar)
        
        let navItem = UINavigationItem(title: "Set Date and Time")
        navItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.cancelChange))
        navItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.saveChange))
        
        navBar.setItems([navItem], animated: false)
        
        //init date and time picker
        datePicker.date = passedDate
        timePicker.date = passedTime
        
        //updateTime
        updateTime()
        
    }
    
    func updateTime() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        
        let dateString = dateFormatter.string(from: passedDate)
        
        todayLabel.text = "Today is : " + dateString
    }

    
    func cancelChange() {
//        _ = self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    func saveChange() {
        self.delegate?.changedDateAndTime(date: datePicker.date, time: timePicker.date)
        
//        _ = self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
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
