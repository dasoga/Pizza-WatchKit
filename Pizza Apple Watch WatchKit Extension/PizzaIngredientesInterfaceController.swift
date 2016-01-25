//
//  PizzaIngredientesInterfaceController.swift
//  Pizza Apple Watch
//
//  Created by Dante Solorio on 1/23/16.
//  Copyright © 2016 Dante Solorio. All rights reserved.
//

import WatchKit
import Foundation


class PizzaIngredientesInterfaceController: WKInterfaceController {
    
    @IBOutlet var ingredientesTable: WKInterfaceTable!
    @IBOutlet var doneButton: WKInterfaceButton!
    
    let pizzaIngredientes = ["Jamón", "Salami", "Salchicha", "Pepperoni", "Aceituna", "Piña", "Cebolla", "Pimiento"]
    
    var pizzaIngredientesSelected: [String] = []

    var pizzaObj = Pizza!()
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        pizzaObj = context as! Pizza
        doneButton.setEnabled(false)
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
        ingredientesTable.setNumberOfRows(pizzaIngredientes.count, withRowType: "IngredientesTable")
        
        for var i = 0; i < pizzaIngredientes.count; ++i {
            if let row = ingredientesTable.rowControllerAtIndex(i) as? IngredientesTable {
                row.cellLabel.setText(pizzaIngredientes[i])
                //let imageName = entry.completed ? "check-completed" : "check-empty"
                let imageName: String = "empty"
                row.cellCheckImage.setImageNamed(imageName)
            }
        }
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        let cell = ingredientesTable.rowControllerAtIndex(rowIndex) as? IngredientesTable
        let actualIngrediente = pizzaIngredientes[rowIndex]
        if pizzaIngredientesSelected.count > 0{
            if pizzaIngredientesSelected.count < 5{
                if pizzaIngredientesSelected.contains(actualIngrediente){
                    let imageName = "empty"
                    cell?.cellCheckImage.setImageNamed(imageName)
                    let actualIndex = pizzaIngredientesSelected.indexOf(actualIngrediente)
                    pizzaIngredientesSelected.removeAtIndex(actualIndex!)
                    if pizzaIngredientesSelected.count == 0{
                        doneButton.setEnabled(false)
                    }
                }else{
                    let imageName = "completed"
                    cell?.cellCheckImage.setImageNamed(imageName)
                    pizzaIngredientesSelected.append(actualIngrediente)
                }
            }else{
                let imageName = "empty"
                cell?.cellCheckImage.setImageNamed(imageName)
            }
        }else{
            let imageName = "completed"
            cell?.cellCheckImage.setImageNamed(imageName)
            pizzaIngredientesSelected.append(actualIngrediente)
            doneButton.setEnabled(true)
        }

        
        
    }

    @IBAction func goToConfirmation(){
        
        pizzaObj.ingredientes = pizzaIngredientesSelected
        self.pushControllerWithName("ConfirmationInterfaceController", context: pizzaObj)
    }

}
