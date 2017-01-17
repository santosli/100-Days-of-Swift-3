//
//  SLTableViewCell.swift
//  Project 30
//
//  Created by Santos on 17/01/2017.
//  Copyright © 2017 santos. All rights reserved.
//

import UIKit

class SLTableViewCell: UITableViewCell {

    @IBOutlet weak var cellNumberLabel: UILabel!
    
    @IBOutlet weak var cellImageView: UIImageView!
    
    @IBOutlet weak var cellTitleLabel: UILabel!
    
    @IBOutlet weak var cellDetailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
