//
//  TransitionManager.swift
//  Project 37
//
//  Created by Santos on 25/01/2017.
//  Copyright © 2017 santos. All rights reserved.
//

import UIKit

class TransitionManager: NSObject,UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    fileprivate let _transitionDuration : TimeInterval
    fileprivate let _operationType : UINavigationControllerOperation

    init(operation: UINavigationControllerOperation) {
        _operationType = operation
        _transitionDuration = 0.2
    }
    
    // MARK: UIViewControllerAnimatedTransitioning protocol methods
    
    // animate a change from one viewcontroller to another
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if _operationType == .push {

            let container = transitionContext.containerView
            
            guard let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)! as? SLCollectionViewController,
                let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from),
                let toView = transitionContext.view(forKey: UITransitionContextViewKey.to),
                let currentCell = fromViewController.sourceCell as? SLImageCollectionViewCell
                else {
                    return
            }
            
            container.addSubview(toView)
            
            let screenshotToView = UIImageView(image: currentCell.imageView.screenshot)
            screenshotToView.frame = currentCell.imageView.frame
            let containerCoord = fromView.convert(currentCell.frame.origin, to: container)
            screenshotToView.frame.origin = containerCoord

            container.addSubview(screenshotToView)
        
            toView.alpha = 0.0
            
            let width = UIScreen.main.bounds.width
            let height = UIScreen.main.bounds.height

            UIView.animate(withDuration: _transitionDuration,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 0,
                           options: [UIViewAnimationOptions.curveEaseOut],
                           animations: { () -> Void in
                            
                            screenshotToView.frame = CGRect(x: 0, y: (height - width)/2, width: width, height: width)
                            toView.alpha = 1.0
                
            }) { _ in
                screenshotToView.removeFromSuperview()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }

        } else {
            
            let container = transitionContext.containerView

            let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
            let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)! as! SLCollectionViewController
            let toCollectionView = toViewController.collectionView!
            let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
            let fromView = fromViewController.view!
            let currentCell = toViewController.sourceCell!
            
            // Add destination view to the container view
            container.addSubview(toView)
            
            // Prepare the screenshot of the source view for animation
            let screenshotFromView = UIImageView(image: fromView.screenshot)
            screenshotFromView.frame = fromView.frame
            
            // Prepare the screenshot of the destination view for animation
            let screenshotToView = UIImageView(image: currentCell.screenshot)
            screenshotToView.frame = screenshotFromView.frame
            
            // Add screenshots to transition container to set-up the animation
            container.addSubview(screenshotToView)
            container.insertSubview(screenshotFromView, belowSubview: screenshotToView)
            
            // Set views initial states
            screenshotToView.alpha = 0.0
            fromView.isHidden = true
            currentCell.isHidden = true
            
            let containerCoord = toCollectionView.convert(currentCell.frame.origin, to: container)
            
            UIView.animate(withDuration: _transitionDuration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [UIViewAnimationOptions.curveEaseOut], animations: { () -> Void in
                
                screenshotToView.alpha = 1.0
                
                screenshotFromView.frame = currentCell.frame
                screenshotFromView.frame.origin = containerCoord
                
                screenshotToView.frame = screenshotFromView.frame

                
            }) { _ in
                
                currentCell.isHidden = false
                screenshotFromView.removeFromSuperview()
                screenshotToView.removeFromSuperview()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                
            }
        }
        
    }
    
    // return how many seconds the transiton animation will take
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return _transitionDuration
    }
    
    // MARK: UIViewControllerTransitioningDelegate protocol methods
    
    // return the animataor when presenting a viewcontroller
    // remmeber that an animator (or animation controller) is any object that aheres to the UIViewControllerAnimatedTransitioning protocol
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    // return the animator used when dismissing from a viewcontroller
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }

}
