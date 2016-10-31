//
//  SLSecondViewController.swift
//  Project 09
//
//  Created by Santos on 31/10/2016.
//  Copyright © 2016 santos. All rights reserved.
//

import UIKit

class SLSecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var secondTextView: UITextView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        secondTextView.text = "\"Twelve significant photographs in any one year is a good crop.\"\n—Ansel Adams\n\n"
        
        //add camera button
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(self.selectPic))
        
        //set delegate
        imagePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func selectPic() {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            //create and NSTextAttachment and add your image to it.
            let attachment = NSTextAttachment()
            let imageWidth = pickedImage.size.width
            let scaleFactor = imageWidth / (secondTextView.frame.size.width - 10)

//            attachment.image = UIImage(cgImage: pickedImage.cgImage!, scale: scaleFactor, orientation: .up)
            
            attachment.image = pickedImage.resizeImageWithFactor(scale: scaleFactor)
            
            //put your NSTextAttachment into and attributedString
            let attString = NSAttributedString(attachment: attachment)
            
            //add this attributed string to the current position.
            secondTextView.textStorage.insert(attString, at: secondTextView.selectedRange.location)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
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

extension UIImage {
    func resizeImageWithFactor(scale: CGFloat) -> UIImage {
        let newSize = CGSize(width: size.width/scale, height: size.height/scale)
        
        // Guard newSize is different
        guard self.size != newSize else { return self }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
