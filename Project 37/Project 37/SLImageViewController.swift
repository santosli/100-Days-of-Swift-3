//
//  SLImageViewController.swift
//  Project 37
//
//  Created by Santos on 25/01/2017.
//  Copyright © 2017 santos. All rights reserved.
//

import UIKit

class SLImageViewController: UIViewController {
    
    var imageName: String!

    @IBOutlet weak var largeImageView: UIImageView!
    
    fileprivate var percentDrivenTransition: UIPercentDrivenInteractiveTransition?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        largeImageView.image = UIImage(named: imageName)
        largeImageView.backgroundColor = .white
                
        prepareGestureRecognizerInView(self.view)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.delegate = self
    }
    
    private func prepareGestureRecognizerInView(_ view: UIView) {
        let gesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleGesture(_:)))
        gesture.edges = UIRectEdge.left
        view.addGestureRecognizer(gesture)
    }

    func handleGesture(_ gestureRecognizer: UIScreenEdgePanGestureRecognizer) {
        let progress = gestureRecognizer.translation(in: self.view).x / self.view.bounds.width

        switch gestureRecognizer.state {
            
        case .began:
            self.percentDrivenTransition = UIPercentDrivenInteractiveTransition()
            _ = self.navigationController?.popViewController(animated: true)
            
        case .changed:
            self.percentDrivenTransition?.update(progress)
            
        case .ended, .cancelled:
            if progress > 0.3 {
                self.percentDrivenTransition?.finish()
            } else {
                self.percentDrivenTransition?.cancel()
            }
            self.percentDrivenTransition = nil
            
        default:
            print("Unsupported")
        }
    }

}

extension SLImageViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TransitionManager(operation: operation)
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if animationController is TransitionManager {
            return self.percentDrivenTransition
        } else {
            return nil
        }
    }
}
