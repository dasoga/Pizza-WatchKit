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
    
    let pizzaIngredientes = ["Jamón", "Salami", "Salchicha", "Pepperoni", "Aceituna", "Piña", "Cebolla", "Pimiento"]
    
    var pizzaIngredientesSelected: [Int] = []

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
        ingredientesTable.setNumberOfRows(pizzaIngredientes.count, withRowType: "IngredientesTable")
        
        for var i = 0; i < pizzaIngredientes.count; ++i {
            if let row = ingredientesTable.rowControllerAtIndex(i) as? IngredientesTable {
                row.cellLabel.setText(pizzaIngredientes[i])
                //let imageName = entry.completed ? "check-completed" : "check-empty"
                let imageName: String = "check-empty"
                row.cellCheckImage.setImageNamed(imageName)
            }
        }
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        let cell = ingredientesTable.rowControllerAtIndex(rowIndex) as? IngredientesTable
        
        if pizzaIngredientesSelected.count > 0{
            if pizzaIngredientesSelected.count < 5{
                if pizzaIngredientesSelected.contains(rowIndex){
                    print("Repetido")
                    let imageName = "check-empty"
                    cell?.cellCheckImage.setImageNamed(imageName)
                    pizzaIngredientesSelected.removeAtIndex(rowIndex)
                }else{
                    print("Nuevo")
                    let imageName = "check-completed"
                    cell?.cellCheckImage.setImageNamed(imageName)
                    pizzaIngredientesSelected.append(rowIndex)
                }
            }else{
                let imageName = "check-empty"
                cell?.cellCheckImage.setImageNamed(imageName)
                pizzaIngredientesSelected.removeAtIndex(rowIndex)
            }
        }else{
            let imageName = "check-completed"
            cell?.cellCheckImage.setImageNamed(imageName)
            pizzaIngredientesSelected.append(rowIndex)
            
        }

        
        
    }

    @IBAction func goToConfirmation(){
        self.pushControllerWithName("ConfirmationInterfaceController", context: pizzaIngredientes)
    }

}
