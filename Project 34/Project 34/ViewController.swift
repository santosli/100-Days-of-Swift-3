//
//  ViewController.swift
//  Project 34
//
//  Created by Santos on 23/01/2017.
//  Copyright © 2017 santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeigth = UIScreen.main.bounds.height
    let googleLogWidth = 200
    let googleLogHeigth = 80
    let initAlpha: CGFloat = 0
    
    let googleLogView = UIImageView()
    let searhBarView = UIImageView()
    let settingIconView = UIImageView()
    let reorderIconView = UIImageView()
    let signInButton = UIButton()
    let voiceIconView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //init view
        initView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //do animation
        showItems()
    }
    
    func initView() {
        //google Log
        googleLogView.image = UIImage(named: "googlelog.png")
        googleLogView.frame = CGRect(x: Int(screenWidth/2) - googleLogWidth/2, y: Int(screenHeigth/2) - googleLogHeigth/2, width: googleLogWidth, height: googleLogHeigth)
        googleLogView.contentMode = .scaleAspectFit
        self.view.addSubview(googleLogView)
        
        //search bar
        searhBarView.image = UIImage(named: "searchbar.png")
        searhBarView.frame = CGRect(x: Int(screenWidth/2) - 150, y: Int(screenHeigth/2) + 20, width: 300, height: 45)
        searhBarView.layer.shadowColor = UIColor.gray.cgColor
        searhBarView.layer.shadowOpacity = 1
        searhBarView.layer.shadowOffset = CGSize.zero
        searhBarView.layer.shadowRadius = 1
        searhBarView.alpha = initAlpha
        self.view.addSubview(searhBarView)
        
        //setting icon
        settingIconView.image = UIImage(named: "settings.png")
        settingIconView.frame = CGRect(x: 60, y: 80, width: 25, height: 25)
        settingIconView.alpha = initAlpha
        self.view.addSubview(settingIconView)
        
        //reorder icon
        reorderIconView.image = UIImage(named: "reorder.png")
        reorderIconView.frame = CGRect(x: 300, y: 80, width: 25, height: 25)
        reorderIconView.alpha = initAlpha
        self.view.addSubview(reorderIconView)
        
        //sign in button
        signInButton.setTitle("SIGN IN", for: .normal)
        signInButton.setTitleColor(.gray, for: .normal)
        signInButton.frame = CGRect(x: 140, y: 80, width: 80, height: 25)
        signInButton.alpha = initAlpha
        self.view.addSubview(signInButton)
        
        //voice icon
        voiceIconView.image = resizeImage(UIImage(named: "voice.png")!, targetSize: CGSize(width: 35, height: 35))
        voiceIconView.frame = CGRect(x: 160, y: 420, width: 0, height: 0)
        voiceIconView.layer.borderWidth = 0
        voiceIconView.layer.cornerRadius = 30
        voiceIconView.layer.shadowColor = UIColor.gray.cgColor
        voiceIconView.layer.shadowOpacity = 0.5
        voiceIconView.layer.shadowOffset = CGSize.zero
        voiceIconView.layer.shadowRadius = 1
        voiceIconView.backgroundColor = .white
        voiceIconView.contentMode = .center
        voiceIconView.alpha = initAlpha
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showSpeakerView))
        voiceIconView.isUserInteractionEnabled = true
        voiceIconView.addGestureRecognizer(tapGesture)
        
        self.view.addSubview(voiceIconView)

}
    
    func showItems() {
        //do animate
        let duration = 0.2
        let delay = 0.1
        let options = UIViewAnimationOptions.curveEaseInOut
        let damping = 0.3 // set damping ration
        let velocity = 1.0 // set initial velocity
        
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping:CGFloat(damping),
                       initialSpringVelocity: CGFloat(velocity), options: options, animations: {
                        
                        self.googleLogView.frame = CGRect(x: Int(self.screenWidth/2) - self.googleLogWidth/2, y: Int(self.screenHeigth/2) - self.googleLogHeigth/2 - 100, width: self.googleLogWidth, height: self.googleLogHeigth)
                        
                        self.searhBarView.frame = CGRect(x: Int(self.screenWidth/2) - 150, y: Int(self.screenHeigth/2) - 20, width: 300, height: 45)
                        
                        self.settingIconView.frame = CGRect(x: 25, y: 25, width: 25, height: 25)
                        
                        self.reorderIconView.frame = CGRect(x: 325, y: 25, width: 25, height: 25)
                        
                        self.signInButton.frame = CGRect(x: 140, y: 25, width: 80, height: 25)
                        
                        self.voiceIconView.frame = CGRect(x: 160, y: 420, width: 60, height: 60)

                        self.searhBarView.alpha = 1.0
                        self.settingIconView.alpha = 1.0
                        self.reorderIconView.alpha = 1.0
                        self.signInButton.alpha = 1.0
                        self.voiceIconView.alpha = 1.0
                        
        }, completion: { finished in
        })
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    func resizeImage(_ image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    let segueIdentifier = "showSpeaker"
    
    func showSpeakerView() {
        self.performSegue(withIdentifier: segueIdentifier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

    @IBAction func unwindToFirst(segue: UIStoryboardSegue) {}
}

