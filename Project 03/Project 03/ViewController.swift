//
//  ViewController.swift
//  Project 03
//
//  Created by Santos on 21/10/2016.
//  Copyright © 2016 santos. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {
    @IBOutlet weak var bannerView: GADBannerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

