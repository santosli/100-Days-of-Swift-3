//
//  SLEntry.swift
//  Project 23
//
//  Created by Santos on 30/11/2016.
//  Copyright © 2016 santos. All rights reserved.
//

import UIKit

class SLEntry: NSObject {
    let id : Int64!
    var text : String!
    var image : String!
    var location : String!
    var date : Date!
    
    init(id: Int64, text: String, image: String, location: String, date: Date) {
        self.id = id
        self.text = text
        self.image = image
        self.location = location
        self.date = date
    }
}
