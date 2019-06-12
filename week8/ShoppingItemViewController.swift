//
//  ShoppingItemViewController.swift
//  MyShoppingList
//
//  Created by ANT MAN on 24/3/2562 BE.
//  Copyright © 2562 mossnana.com. All rights reserved.
//

import Foundation
import UIKit
class ShoppingItemViewController: UIViewController {
    var delegate : ShoppingItemViewControllerDelegate?
    var myShoppingItem: ShoppingItem?
    var myNewItem: Int = 0
    
    @IBOutlet weak var txtProductName: UITextField!
    @IBOutlet weak var txtProductNumber: UITextField!
    @IBOutlet weak var txtProductUnitPrice: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let v = myShoppingItem {
            txtProductName.text = v.shoppingProductName
            txtProductNumber.text = "\(v.shoppingProductNumber)"
            txtProductUnitPrice.text = "\(v.shoppingProductUnitPrice)"
        }
    }
    
    @IBAction func saveMethod() {
        
        txtProductName.resignFirstResponder()
        txtProductNumber.resignFirstResponder()
        txtProductUnitPrice.resignFirstResponder()
        
        let trimProductName = txtProductName.text?.trimmingCharacters(in: .whitespaces)
        let trimProductNumber = txtProductNumber.text?.trimmingCharacters(in: .whitespaces)
        let trimProductUnitPrice = txtProductUnitPrice.text?.trimmingCharacters(in: .whitespaces)
        
        if ((trimProductName?.isEmpty)! || (trimProductNumber?.isEmply)! || (trimProductUnitPrice?.isEmply)!){
            let alertController = UIAlertController(title: "Mdd", message: "xxxxxx", preferredStyle: .alert)
            let cancelButton = UIAlertAction(title: "Close", style: .cancel, handler: nil)
            let clearButton = UIAlertAction(title: "Clear", style: .default, handler: {(action) in
                self.txtProductName.text = ""
                self.txtProductNumber.text = ""
                self.txtProductUnitPrice.text = ""
            })
        }
        
        if myShoppingItem == nil {
            myShoppingItem = ShoppingItem()
        }
        //อ่านค่าจาก TextField
        myShoppingItem!.shoppingProductName = txtProductName.text!
        myShoppingItem!.shoppingProductNumber = Int(txtProductNumber.text!)!
        myShoppingItem!.shoppingProductUnitPrice = Double(txtProductUnitPrice.text!)!
        //เรียกผู้ช่วยให้มาทํางานให้
        delegate?.addShoppingItem(newShoppingItem: myShoppingItem!, newItem: myNewItem)
    }
    
    @IBAction func cancelMethod() {
        //เรียกผู้ช่วยให้มาทํางานให้
        delegate?.cancelShoppingItem()
    }
    
}
