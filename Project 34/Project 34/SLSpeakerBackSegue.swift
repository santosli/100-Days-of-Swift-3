//
//  SLSpeakerBackSegue.swift
//  Project 34
//
//  Created by Santos on 24/01/2017.
//  Copyright © 2017 santos. All rights reserved.
//

import UIKit

class SLSpeakerBackSegue: UIStoryboardSegue {
    
    override func perform() {
        let fromViewController = source as! SLSpeakerViewController
        let toViewController = destination as! ViewController
        
        fromViewController.view.superview?.insertSubview(toViewController.view, at: 0)
        
        let speakerButton = toViewController.voiceIconView
        
        // Create CAShapeLayerS
        let rectShape = CAShapeLayer()
        fromViewController.view.layer.mask = rectShape
        
        rectShape.fillColor = UIColor.white.cgColor
        
        let endShape = UIBezierPath(ovalIn: (speakerButton.frame)).cgPath
        let startShape = UIBezierPath(arcCenter: speakerButton.center, radius: 500, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true).cgPath
        
        // set initial shape
        rectShape.path = startShape
        
        // animate the `path`
        let animation = CABasicAnimation(keyPath: "path")
        animation.fromValue = startShape
        animation.toValue = endShape
        animation.duration = 0.2
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut) // animation curve is Ease Out
        animation.fillMode = kCAFillModeBoth // keep to value after finishing
        animation.isRemovedOnCompletion = false
        
        rectShape.add(animation, forKey: animation.keyPath)
        

        UIView.animate(withDuration: 0.2, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            
            fromViewController.redVoiceIconView.frame = CGRect(x: 160, y: 420, width: 60, height: 60)
            fromViewController.redVoiceIconView.alpha = 0
            
        }, completion: { finished in
            let fromVC = self.source
            fromVC.dismiss(animated: false, completion: nil)
        })
    }
}
