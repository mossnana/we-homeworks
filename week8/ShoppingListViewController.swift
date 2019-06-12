//
//  ViewController.swift
//  MyShoppingList
//
//  Created by ANT MAN on 24/3/2562 BE.
//  Copyright © 2562 mossnana.com. All rights reserved.
//

import UIKit
// เรียก UITableViewDelegate, UITableViewDataSource สำหรับเป็นผู้ช่วย Table View ในหน้านี้
// เรียก ShoppingItemViewControllerDelegate ในการเป็น Interface ให้กับการส่งข้อมูลของหน้าที่แล้ว
class ShoppingListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ShoppingItemViewControllerDelegate {

    var myShoppingList : [ShoppingItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "My Shopping List"
        // ประกาศไว้ก่อนเป็นค่าเริ่มต้นในตอนแรก เพราะยังไม่มีการเรียกใช้งาน delegate ของ ShoppingItemViewControllerDelegate
        myTableView.delegate = self
        myTableView.dataSource = self
        self.navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        myTableView.setEditing(editing, animated: true)
    }
    
    func addShoppingItem(newShoppingItem: ShoppingItem, newItem: Int){
        if newItem == -1 {
            myShoppingList.append(newShoppingItem)
        } else {
            myShoppingList[newItem] = newShoppingItem
        }
        myTableView.reloadData()
        // ปิดหน้านั้นออกไป
        self.dismiss(animated: true, completion: nil)
    }
    
    func cancelShoppingItem(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView)->Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int {
        return myShoppingList.count
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath)->Bool {
        return true
    }
    
    func tableView(_ _tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath){
        let tempShoppingItem = myShoppingList[sourceIndexPath.row]
        myShoppingList.remove(at: sourceIndexPath.row)
        myShoppingList.insert(tempShoppingItem, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let myShoppingDetail = "จํานวน \(myShoppingList[indexPath.row].shoppingProductNumber) @\(myShoppingList[indexPath.row].shoppingProductUnitPrice) บาท"
        cell.textLabel?.text = myShoppingList[indexPath.row].shoppingProductName
        cell.detailTextLabel?.text = myShoppingDetail
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle:UITableViewCell.EditingStyle,forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
            myShoppingList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        (segue.destination as! ShoppingItemViewController).delegate = self
        let myVC = segue.destination as! ShoppingItemViewController
        if segue.identifier == "NewItem" {
            myVC.myNewItem = -1
        } else {
            let indexPath = myTableView.indexPathForSelectedRow!
            myVC.myShoppingItem = myShoppingList[indexPath.row]
            myVC.myNewItem = indexPath.row
        }
        myVC.delegate = self
    }
    
    @IBOutlet weak var myTableView: UITableView!
    
}
