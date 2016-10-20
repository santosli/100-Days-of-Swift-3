//
//  ViewController.swift
//  Project 02
//
//  Created by Santos on 20/10/2016.
//  Copyright © 2016 santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var countNumber: UILabel!
    @IBOutlet weak var tapOrHoldButton: UIButton!

    var counter = 0
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnce(_:)))
        let holdGestrue = UILongPressGestureRecognizer(target: self, action: #selector(longTap(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapOrHoldButton.addGestureRecognizer(tapGesture)
        tapOrHoldButton.addGestureRecognizer(holdGestrue)
        
        updateCountNumber()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tapOnce(_ sender: UIGestureRecognizer) {
        print("tap once")
        
        counter += 1
        updateCountNumber()
    }
    
    func longTap(_ sender: UIGestureRecognizer) {
        print("long tap")
        if sender.state == .ended {
            timer.invalidate()
        } else if sender.state == .began {
            timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(countNumberPlusOne), userInfo: nil, repeats: true)
        }
    }
    
    func countNumberPlusOne() {
        counter += 1
        updateCountNumber()
    }
    
    
    
    func updateCountNumber() {
        countNumber.text = String(counter)
    }

    @IBAction func resetCountNumber(_ sender: AnyObject) {
        counter = 0
        updateCountNumber()
    }

}

