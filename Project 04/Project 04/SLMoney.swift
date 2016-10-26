//
//  SLMoney.swift
//  Project 04
//
//  Created by Santos on 26/10/2016.
//  Copyright © 2016 santos. All rights reserved.
//

import UIKit


class SLMoney: NSObject {
    var cash : Double {
        didSet {
            self.tip = self.cash * Double(self.tipPercent) / 100
            self.total = self.cash + self.tip
        }
    }
    
    var tipPercent : Int {
        didSet {
            self.tip = self.cash * Double(self.tipPercent) / 100
            self.total = self.cash + self.tip
        }
    }
    
    var tip : Double = 0.0
    
    var total : Double = 0.0
    
    override init() {
        self.cash = 0.0
        self.tipPercent = 0
        
        super.init()
    }
}
