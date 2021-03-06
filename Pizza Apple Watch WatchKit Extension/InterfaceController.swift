//
//  InterfaceController.swift
//  Pizza Apple Watch WatchKit Extension
//
//  Created by Dante Solorio on 1/23/16.
//  Copyright © 2016 Dante Solorio. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet var sizeTable: WKInterfaceTable!
    
    let pizzaSizes = ["Chica", "Mediana", "Grande"]

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        setupTable()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func setupTable() {
        sizeTable.setNumberOfRows(pizzaSizes.count, withRowType: "ItemsTable")
        
        for var i = 0; i < pizzaSizes.count; ++i {
            if let row = sizeTable.rowControllerAtIndex(i) as? ItemsTable {
                row.cellLabel.setText(pizzaSizes[i])
            }
        }
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        self.pushControllerWithName("PizzaMasaInterfaceController", context: pizzaSizes[rowIndex])
    }

}
