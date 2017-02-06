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
        _transitionDuration = 0.3
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
            let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)! as! SLImageViewController
            let currentCell = toViewController.sourceCell! as! SLImageCollectionViewCell
            
            // Add destination view to the container view
            container.addSubview(toView)
            
            // Prepare the screenshot of the source view for animation
            let screenshotFromView = UIImageView(image: fromViewController.largeImageView.screenshot)
            screenshotFromView.frame = fromViewController.largeImageView.frame
            container.addSubview(screenshotFromView)
            
            fromViewController.largeImageView.alpha = 0.0
            toView.alpha = 0.0
            currentCell.isHidden = true
            
            let containerCoord = toCollectionView.convert(currentCell.frame.origin, to: container)
            
            UIView.animate(withDuration: _transitionDuration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [UIViewAnimationOptions.curveEaseOut], animations: { () -> Void in
                screenshotFromView.frame = currentCell.imageView.frame
                screenshotFromView.frame.origin = containerCoord
                toView.alpha = 1.0
                
            }) { _ in
                fromViewController.largeImageView.alpha = 1.0
                currentCell.isHidden = false
                screenshotFromView.removeFromSuperview()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                
            }
        }
        
    }
    
    // return how many seconds the transiton animation will take
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return _transitionDuration
    }
}
