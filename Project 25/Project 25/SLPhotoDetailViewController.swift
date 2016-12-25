//
//  SLPhotoDetailViewController.swift
//  Project 25
//
//  Created by Santos on 25/12/2016.
//  Copyright © 2016 santos. All rights reserved.
//

import UIKit

class SLPhotoDetailViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    
    var imageName : String = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //setup navigationbar
        navigationItem.title = "PhotoName"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(alertActionSheet))
        
        //init photo
        photoImageView.image = UIImage(named: imageName)
    }
}


extension SLPhotoDetailViewController {
    func alertActionSheet() {
        let actionSheetController = UIAlertController(title: "", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (UIAlertAction) in
        }
        
        let shareAction = UIAlertAction(title: "Share", style: .default) { (UIAlertAction) in
        }
        
        let saveAction = UIAlertAction(title: "Save Image", style: .default) { (UIAlertAction) in
        }
        
        let copyAction = UIAlertAction(title: "Copy Link", style: .default) { (UIAlertAction) in
        }

        actionSheetController.addAction(cancelAction)
        actionSheetController.addAction(shareAction)
        actionSheetController.addAction(saveAction)
        actionSheetController.addAction(copyAction)
        
        //change title color
        let attributedString = NSAttributedString(string: "Report", attributes: [
            NSForegroundColorAttributeName : UIColor.red,
            NSFontAttributeName : UIFont.systemFont(ofSize: 20)])
        
        actionSheetController.setValue(attributedString, forKey: "attributedTitle")
        
        present(actionSheetController, animated: true, completion: nil)
    }
}
