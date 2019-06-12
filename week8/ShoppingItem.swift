//
//  ShoppingItem.swift
//  MyShoppingList
//
//  Created by ANT MAN on 24/3/2562 BE.
//  Copyright © 2562 mossnana.com. All rights reserved.
//

import UIKit

class ShoppingItem: NSObject {
    var shoppingProductName : String
    var shoppingProductNumber : Int
    var shoppingProductUnitPrice : Double
    
    override init() {
        self.shoppingProductName = ""
        self.shoppingProductNumber = 0
        self.shoppingProductUnitPrice = 0.0
    }
    
    init(shoppingProductName : String, shoppingProductNumber : Int,
         shoppingProductUnitPrice : Double) {
        self.shoppingProductName = shoppingProductName
        self.shoppingProductNumber = shoppingProductNumber
        self.shoppingProductUnitPrice = shoppingProductUnitPrice
    }
}
