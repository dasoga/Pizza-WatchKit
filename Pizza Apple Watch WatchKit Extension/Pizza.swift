//
//  Pizza.swift
//  Pizza Apple Watch
//
//  Created by Dante on 1/25/16.
//  Copyright © 2016 Dante Solorio. All rights reserved.
//

import WatchKit

class Pizza: NSObject {
    
    var size: String
    var masa: String
    var queso: String
    var ingredientes: [String]
    
    init(size: String, masa:String, queso:String, ingredientes:[String]) {
        self.size = size
        self.masa = masa
        self.queso = queso
        self.ingredientes = ingredientes
    }

}
