//
//  ViewController.swift
//  Project 20
//
//  Created by Santos on 25/11/2016.
//  Copyright © 2016 santos. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var locationLable: UILabel!
    
    let locationManger = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func refreshLocation(_ sender: Any) {
        locationManger.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.requestWhenInUseAuthorization()
        locationManger.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks: [CLPlacemark]?, error: Error?) in
            if error == nil && (placemarks?.count)! > 0 {
                let location = (placemarks?[0])! as CLPlacemark
                self.locationLable.text = location.thoroughfare! + ", " +
                    location.administrativeArea! + ", " + location.country!
            }else {
                print("error 1:" + (error?.localizedDescription)!)
            }
        })
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error 2: " + error.localizedDescription)
    }

}

