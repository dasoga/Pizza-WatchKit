//
//  PizzaQuesoInterfaceController.swift
//  Pizza Apple Watch
//
//  Created by Dante Solorio on 1/23/16.
//  Copyright © 2016 Dante Solorio. All rights reserved.
//

import WatchKit
import Foundation


class PizzaQuesoInterfaceController: WKInterfaceController {
    
    @IBOutlet var quesoTable: WKInterfaceTable!
    
    let pizzaQuesos = ["Mozarelia", "Cheddar", "Parmesano", "Sin Queso"]

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
    
    func setupTable(){
        quesoTable.setNumberOfRows(pizzaQuesos.count, withRowType: "ItemsTable")
        
        for var i = 0; i < pizzaQuesos.count; ++i {
            if let row = quesoTable.rowControllerAtIndex(i) as? ItemsTable {
                row.cellLabel.setText(pizzaQuesos[i])
            }
        }
        
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        self.pushControllerWithName("PizzaIngredientesInterfaceController", context: pizzaQuesos[rowIndex])
    }

}
