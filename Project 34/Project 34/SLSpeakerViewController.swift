//
//  SLSpeakerViewController.swift
//  Project 34
//
//  Created by Santos on 24/01/2017.
//  Copyright © 2017 santos. All rights reserved.
//

import UIKit

class SLSpeakerViewController: UIViewController {

    let redVoiceIconView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //init view
        initView()
    }
    
    func initView() {
        //set speaker icon
        redVoiceIconView.image = UIImage(named: "redvoice.png")
        redVoiceIconView.frame = CGRect(x: 160, y: 420, width: 60, height: 60)
        redVoiceIconView.alpha = 0
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goBack))
        redVoiceIconView.isUserInteractionEnabled = true
        redVoiceIconView.addGestureRecognizer(tapGesture)
        
        self.view.addSubview(redVoiceIconView)
    }
    
    
    let unwindSegueIdentifier = "unwindSpeaker"
    func goBack() {
        self.performSegue(withIdentifier: unwindSegueIdentifier, sender: self)
    }

    override var prefersStatusBarHidden : Bool {
        return true
    }
    
}
