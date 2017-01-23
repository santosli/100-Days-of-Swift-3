//
//  ViewController.swift
//  Project 32
//
//  Created by Santos on 22/01/2017.
//  Copyright © 2017 santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let marioSize = 128
    let mushroomSize = 40
    let screenWidth = UIScreen.main.bounds.width
    
    var mario: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //init mario
        initMario()
        
        //init button
        initShootButton()
    }
    
    func initMario() {
        mario = UIImageView(frame: CGRect(x: 0, y: 200, width: marioSize, height: marioSize))
        mario.image = UIImage(named: "mario1.png")
        self.view.addSubview(mario)
    }
    
    func initShootButton() {
        let shootButton = UIButton(frame: CGRect(x: 0, y: 550, width: 64, height: 32))
        shootButton.setTitle("Shoot", for: .normal)
        shootButton.setTitleColor(.blue, for: .normal)
        shootButton.center.x = screenWidth/2
        
        //add button action
        shootButton.addTarget(self, action: #selector(shoot), for: .touchUpInside)
        
        self.view.addSubview(shootButton)
    }
    
    func shoot() {
        //shoot mushroom
        let mushroom = UIImageView(frame: CGRect(x: marioSize, y: 180 + marioSize/2, width: mushroomSize, height: mushroomSize))
        mushroom.image = UIImage(named: "mushroom.png")
        self.view.addSubview(mushroom)
        
        mario.image = UIImage(named: "mario2.png")
        
        //shoot
        UIView.animate(withDuration: 0.3, animations: {
            mushroom.frame = CGRect(x: Int(self.screenWidth), y: 180 + self.marioSize/2, width: self.mushroomSize, height: self.mushroomSize)
            
        }, completion: { finished in
            self.mario.image = UIImage(named: "mario1.png")
        })
    }

}

