//
//  SLCustomSegue.swift
//  Project 22
//
//  Created by Santos on 30/11/2016.
//  Copyright © 2016 santos. All rights reserved.
//

import UIKit

class SLCustomSegue: UIStoryboardSegue {
    override func perform() {
        let toViewController = destination
        let fromViewController = source
        
        let containerView = fromViewController.view.superview
        let screenBounds = UIScreen.main.bounds
        
        let finalToFrame = screenBounds
        let finalFromFrame = finalToFrame.offsetBy(dx: 0, dy: screenBounds.size.height)
        
        toViewController.view.frame = finalToFrame.offsetBy(dx: 0, dy: -screenBounds.size.height)
        containerView?.addSubview(toViewController.view)
        
        UIView.animate(withDuration: 0.5, animations: {
            toViewController.view.frame = finalToFrame
            fromViewController.view.frame = finalFromFrame
        }, completion: { finished in
            let fromVC = self.source
            let toVC = self.destination
            fromVC.present(toVC, animated: false, completion: nil)
        })
    }

}
