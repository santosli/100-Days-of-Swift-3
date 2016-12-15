//
//  SLEntryDetailViewController.swift
//  Project 23
//
//  Created by Santos on 05/12/2016.
//  Copyright © 2016 santos. All rights reserved.
//

import UIKit
import CoreLocation

class SLEntryDetailViewController: UIViewController, CLLocationManagerDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var entryTextView: UITextView!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    var entry = SLEntry()
    
    let locationManger = CLLocationManager()
    
    let imagePicker = UIImagePickerController()

    var locationLabel: UILabel!
    
    var currentDate: Date!

    var entryImageView = UIImageView()
    
    var entryImagePath: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //update view
        entryTextView.text = entry.text ?? ""
        self.automaticallyAdjustsScrollViewInsets = false
        
        //init navigationbar 
        self.navigationItem.title = "New Entry"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done
            , target: self, action: #selector(self.saveEntry))
        self.navigationController?.navigationBar.barTintColor = UIColor(red:0.93, green:0.98, blue:0.96, alpha:1.00)
        
        self.navigationController?.navigationBar.tintColor = UIColor(red:0.00, green:0.73, blue:0.58, alpha:1.00)
        
        //get current date
        timeLabel.text = self.getCurrentTime()

        //add toolbar above keyboard
        self.addToolbar()
        
        //set delegate
        imagePicker.delegate = self
        locationManger.delegate = self
    }
    
    func addToolbar () {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        keyboardToolbar.setBackgroundImage(UIImage(), forToolbarPosition: .any, barMetrics: .default)
        keyboardToolbar.setShadowImage(UIImage(), forToolbarPosition: .any)
        
        //add camera button
        let cameraButton = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(self.selectPic))
        cameraButton.tintColor = UIColor(red:0.46, green:0.84, blue:0.74, alpha:1.00)
        
        //add location button
        let locationButton = UIBarButtonItem.init(image: #imageLiteral(resourceName: "location"), style: .plain, target: self, action: #selector(self.getLocation))
        locationButton.tintColor = UIColor(red:0.46, green:0.84, blue:0.74, alpha:1.00)
        
        //add location label
        locationLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        locationLabel.text = entry.location
        locationLabel.textColor = UIColor.darkGray
        locationLabel.font = locationLabel.font.withSize(12)
        let labelItem = UIBarButtonItem(customView: locationLabel)

        //add entry image view
        entryImageView.frame = CGRect(x: 0, y: 0, width: 22, height: 22)
        if entry.imagePath != nil {
            let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            entryImageView.image = UIImage(contentsOfFile: documentDirectory +  entry.imagePath!)
        }
        let imageItem = UIBarButtonItem(customView: entryImageView)
        
        keyboardToolbar.items = [cameraButton, locationButton, labelItem, imageItem]
        entryTextView.inputAccessoryView = keyboardToolbar
    }
    
    func saveEntry() {
        //save entry to the DB
        entry.text = entryTextView.text
        entry.location = locationLabel.text
        entry.date = currentDate
        
        if (entryImagePath != nil) {
            entry.imagePath = "/" + entryImagePath.lastPathComponent
        }
        
        let result = SLEntryDB.sharedInstance.updateEntry(newEntry: self.entry)
        
        if !result {
            print("save entry to DB error")
        }
        
        //back to pre view
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func getLocation() {
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.requestWhenInUseAuthorization()
        locationManger.startUpdatingLocation()
    }
    
    func getCurrentTime() -> String {
        currentDate = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        let dateString = dateFormatter.string(from: currentDate)
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "h:mm a"
        let timeString = timeFormatter.string(from: currentDate)
        
        return dateString + " at " + timeString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks: [CLPlacemark]?, error: Error?) in
            if error == nil && (placemarks?.count)! > 0 {
                let location = (placemarks?[0])! as CLPlacemark
                
                self.locationLabel.text = location.thoroughfare! + ", " + location.administrativeArea!                
            }else {
                print("error 1:" + (error?.localizedDescription)!)
            }
        })
    }

    func selectPic() {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    //MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.entryImageView.image = pickedImage
            
            //save the image to local
            let entryImageName = String(entry.id) + ".jpg"
            
            let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            
            let photoURL = NSURL(fileURLWithPath: documentDirectory)
            entryImagePath = photoURL.appendingPathComponent(entryImageName)
            let data = UIImagePNGRepresentation(pickedImage)
            
            do
            {
                try data?.write(to: entryImagePath!, options: Data.WritingOptions.atomic)
            }
            catch
            {
                // Catch exception here and act accordingly
            }
        }
        
        dismiss(animated: true, completion: nil)
        entryTextView.becomeFirstResponder()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        entryTextView.becomeFirstResponder()
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
