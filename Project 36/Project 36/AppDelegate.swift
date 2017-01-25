//
//  AppDelegate.swift
//  Project 36
//
//  Created by Santos on 25/01/2017.
//  Copyright © 2017 santos. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.backgroundColor = UIColor(red:0.22, green:0.67, blue:0.96, alpha:1.00)
        self.window!.makeKeyAndVisible()
        
        // rootViewController from StoryBoard
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = mainStoryboard.instantiateViewController(withIdentifier: "mainView")
        self.window!.rootViewController = mainViewController
        
        // logo mask
        mainViewController.view.layer.mask = CALayer()
        mainViewController.view.layer.mask?.contents = UIImage(named: "twitterlogo.png")!.cgImage
        mainViewController.view.layer.mask?.bounds = CGRect(x: 0, y: 0, width: 75, height: 60)
        mainViewController.view.layer.mask?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        mainViewController.view.layer.mask?.position = CGPoint(x: mainViewController.view.frame.width / 2, y: mainViewController.view.frame.height / 2)

        // logo mask background view
        let maskBgView = UIView(frame: mainViewController.view.frame)
        maskBgView.backgroundColor = UIColor.white
        mainViewController.view.addSubview(maskBgView)
        mainViewController.view.bringSubview(toFront: maskBgView)
        
        // logo mask animation
        let transformAnimation = CAKeyframeAnimation(keyPath: "bounds")
        transformAnimation.duration = 1
        transformAnimation.beginTime = CACurrentMediaTime() + 1 //add delay of 1 second
        let initalBounds = NSValue(cgRect: (mainViewController.view.layer.mask?.bounds)!)
        let secondBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 60, height: 50))
        let finalBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 2500, height: 2000))
        transformAnimation.values = [initalBounds, secondBounds, finalBounds]
        transformAnimation.keyTimes = [0, 0.5, 1]
        transformAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut), CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)]
        transformAnimation.isRemovedOnCompletion = false
        transformAnimation.fillMode = kCAFillModeForwards
        mainViewController.view.layer.mask?.add(transformAnimation, forKey: "maskAnimation")
        
        // logo mask background view animation
        UIView.animate(withDuration: 0.1,
                                   delay: 1.35,
                                   options: UIViewAnimationOptions.curveEaseIn,
                                   animations: {
                                    maskBgView.alpha = 0.0
        },
                                   completion: { finished in
                                    maskBgView.removeFromSuperview()
        })

        
        // root view animation
        UIView.animate(withDuration: 0.25,
                                   delay: 1.3,
                                   options: [],
                                   animations: {
                                    self.window!.rootViewController!.view.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        },
                                   completion: { finished in
                                    UIView.animate(withDuration: 0.3,
                                                               delay: 0.0,
                                                               options: UIViewAnimationOptions.curveEaseInOut,
                                                               animations: {
                                                                self.window!.rootViewController!.view.transform = CGAffineTransform.identity
                                    },
                                                               completion: nil
                                    )
        })
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        // remove mask when animation completes
        self.window!.rootViewController!.view.layer.mask = nil
    }


}

