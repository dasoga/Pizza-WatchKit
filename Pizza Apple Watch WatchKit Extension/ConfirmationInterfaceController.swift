//
//  ConfirmationInterfaceController.swift
//  Pizza Apple Watch
//
//  Created by Dante Solorio on 1/23/16.
//  Copyright © 2016 Dante Solorio. All rights reserved.
//

import WatchKit
import Foundation


class ConfirmationInterfaceController: WKInterfaceController {

    @IBOutlet var sizeLabel: WKInterfaceLabel!
    @IBOutlet var masaLabel: WKInterfaceLabel!
    @IBOutlet var quesoLabel: WKInterfaceLabel!
    @IBOutlet var ingredientesTable: WKInterfaceTable!
    
    
    var pizzaObj = Pizza!()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        pizzaObj = context as! Pizza

        updateInfo()
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    func updateInfo(){
        self.sizeLabel.setText(pizzaObj.size)
        self.masaLabel.setText(pizzaObj.masa)
        self.quesoLabel.setText(pizzaObj.queso)
        
        ingredientesTable.setNumberOfRows(pizzaObj.ingredientes.count, withRowType: "ItemsTable")
        
        for var i = 0; i < pizzaObj.ingredientes.count; ++i {
            if let row = ingredientesTable.rowControllerAtIndex(i) as? ItemsTable {
                row.cellLabel.setText(pizzaObj.ingredientes[i])
            }
        }
        
    }
    
    @IBAction func goToMyPizza(){
        self.pushControllerWithName("ReadyPizzaInterfaceController", context: nil)
    }
}
