//
//  SLEntryTableViewCell.swift
//  Project 23
//
//  Created by Santos on 05/12/2016.
//  Copyright © 2016 santos. All rights reserved.
//

import UIKit

class SLEntryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var entryImageView: UIImageView!
    
    @IBOutlet weak var entryTextView: UITextView!

    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
