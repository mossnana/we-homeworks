//
//  ShoppingItemViewControllerDelegate.swift
//  MyShoppingList
//
//  Created by ANT MAN on 31/3/2562 BE.
//  Copyright © 2562 mossnana.com. All rights reserved.
//

import Foundation

protocol ShoppingItemViewControllerDelegate {
    func addShoppingItem(newShoppingItem : ShoppingItem, newItem: Int)
    func cancelShoppingItem()
}
