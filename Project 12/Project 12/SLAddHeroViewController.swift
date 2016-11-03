//
//  SLAddHeroViewController.swift
//  Project 12
//
//  Created by Santos on 02/11/2016.
//  Copyright © 2016 santos. All rights reserved.
//

import UIKit

protocol PassingDataProtocol {
    func passingData(_ data : String)
}

class SLAddHeroViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var heroNameTextView: UITextView!
    var delegate: PassingDataProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "Add Hero"
        heroNameTextView.delegate = self
        
        //show up the keyboard
        heroNameTextView.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        //Pass data back to first viewcontroller
        if !heroNameTextView.text.isEmpty {
            delegate?.passingData(heroNameTextView.text!)
        }
        
        //back to first view
        _ = navigationController?.popViewController(animated: true)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if  text == "\n" {
            heroNameTextView.endEditing(true)
            return false
        }
        return true
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
