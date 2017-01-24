//
//  SLSpeakerSegue.swift
//  Project 34
//
//  Created by Santos on 24/01/2017.
//  Copyright © 2017 santos. All rights reserved.
//

import UIKit

class SLSpeakerSegue: UIStoryboardSegue {
    
    override func perform() {
        let fromViewController = source as! ViewController
        let toViewController = destination as! SLSpeakerViewController
        
        let containerView: UIView? = fromViewController.view.superview
        containerView?.addSubview(toViewController.view)

        let speakerButton = fromViewController.voiceIconView

        // Create CAShapeLayerS
        let rectShape = CAShapeLayer()
        toViewController.view.layer.mask = rectShape

        rectShape.fillColor = UIColor.white.cgColor

        let startShape = UIBezierPath(ovalIn: (speakerButton.frame)).cgPath
        let endShape = UIBezierPath(arcCenter: speakerButton.center, radius: 500, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true).cgPath
        
        // set initial shape
        rectShape.path = startShape
        
        // animate the `path`
        let animation = CABasicAnimation(keyPath: "path")
        animation.fromValue = startShape
        animation.toValue = endShape
        animation.duration = 0.2
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut) // animation curve is Ease Out
        animation.fillMode = kCAFillModeBoth // keep to value after finishing
        animation.isRemovedOnCompletion = false // don't remove after finishing

        rectShape.add(animation, forKey: animation.keyPath)

        UIView.animate(withDuration: 0.2, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            
            toViewController.redVoiceIconView.frame = CGRect(x: 160, y: 550, width: 60, height: 60)
            toViewController.redVoiceIconView.alpha = 1.0
            
        }, completion: { finished in
            let fromVC = self.source
            let toVC = self.destination
            fromVC.present(toVC, animated: false, completion: nil)
        })
    }
    
    
}
