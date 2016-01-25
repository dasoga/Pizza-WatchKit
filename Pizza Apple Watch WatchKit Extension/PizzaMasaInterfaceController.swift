//
//  PizzaMasaInterfaceController.swift
//  Pizza Apple Watch
//
//  Created by Dante Solorio on 1/23/16.
//  Copyright © 2016 Dante Solorio. All rights reserved.
//

import WatchKit
import Foundation


class PizzaMasaInterfaceController: WKInterfaceController {
    
    @IBOutlet var masaTable: WKInterfaceTable!

    let pizzaMasas = ["Delgada", "Crujiente", "Gruesa"]
    
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
        masaTable.setNumberOfRows(pizzaMasas.count, withRowType: "ItemsTable")
        
        for var i = 0; i < pizzaMasas.count; ++i {
            if let row = masaTable.rowControllerAtIndex(i) as? ItemsTable {
                row.cellLabel.setText(pizzaMasas[i])
            }
        }
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        self.pushControllerWithName("PizzaQuesoInterfaceController", context: pizzaMasas[rowIndex])
    }
}
