//
//  UIView+Screenshot.swift
//  Project 37
//
//  Created by Santos on 26/01/2017.
//  Copyright © 2017 santos. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    var screenshot: UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0.0)
        if let tableView = self as? UITableView {
            tableView.superview!.layer.render(in: UIGraphicsGetCurrentContext()!)
        } else {
            layer.render(in: UIGraphicsGetCurrentContext()!)
        }
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
}
