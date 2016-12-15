//
//  SLEntry.swift
//  Project 23
//
//  Created by Santos on 30/11/2016.
//  Copyright © 2016 santos. All rights reserved.
//

import UIKit

class SLEntry: NSObject {
    var id : Int64
    var text : String!
    var imagePath : String!
    var location : String!
    var date : Date
    
    init(id: Int64, text: String, imagePath: String, location: String, date: Date) {
        self.id = id
        self.text = text
        self.imagePath = imagePath
        self.location = location
        self.date = date
    }
    
    override init() {
        self.id = -1
        self.text = ""
        self.imagePath = ""
        self.location = ""
        self.date = Date()
    }
}
