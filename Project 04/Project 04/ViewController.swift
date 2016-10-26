//
//  ViewController.swift
//  Project 04
//
//  Created by Santos on 26/10/2016.
//  Copyright © 2016 santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cashTextField: UITextField!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    var money = SLMoney()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.addDoneButtonOnKeyboard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tipPercentChanged(_ sender: UISlider) {
        money.tipPercent = Int(sender.value)
        self.updateUI()
    }
    
    func updateUI() {
        if money.cash != 0.0 {
            cashTextField.text = String(format:"$ %.2f", money.cash)
        }
        tipPercentLabel.text = "Tip (\(money.tipPercent) %):"
        tipLabel.text = String(format:"$ %.2f", money.tip)
        totalLabel.text = String(format:"$ %.2f", money.total)
    }
    
    func addDoneButtonOnKeyboard() {
        let keyboardDoneButtonView = UIToolbar.init()
        keyboardDoneButtonView.sizeToFit()
        let doneButton = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.done,
                                              target: self,
                                              action: #selector(self.doneClicked(sender:)))
        
        keyboardDoneButtonView.items = [doneButton]
        cashTextField.inputAccessoryView = keyboardDoneButtonView
    }
    
    func doneClicked(sender: AnyObject) {
        self.view.endEditing(true)
        money.cash = Double(cashTextField.text!)!
        updateUI()
    }
    

}

