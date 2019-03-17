//
//  MainTableViewController.swift
//  MyContactView
//
//  Created by ANT MAN on 17/3/2562 BE.
//  Copyright © 2562 mossnana.com. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    var myContactInfoList: [ContactInformation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Contact List"
        
        let myFriend1 :ContactInformation = ContactInformation(contactName: "Permpoon", contactNickName: "Perm", contactPhoneNumber: "0806775134", contactType: 0, contactPublicType: 0, contactImage: UIImage(named: "b1.png")!)
        let myFriend2 :ContactInformation = ContactInformation(contactName: "Wiraphorn", contactNickName: "ee", contactPhoneNumber: "0698854575", contactType: 0, contactPublicType: 0, contactImage: UIImage(named: "g1.png")!)
        let myFriend3 :ContactInformation = ContactInformation(contactName: "Permpoon Junior 1", contactNickName: "Potter", contactPhoneNumber: "0544564545", contactType: 0, contactPublicType: 1, contactImage: UIImage(named: "b2.png")!)
        let myFriend4 :ContactInformation = ContactInformation(contactName: "Permpoon Junior 2", contactNickName: "Ar - Muai", contactPhoneNumber: "0894452245", contactType: 0, contactPublicType: 1, contactImage: UIImage(named: "g2.png")!)
        
        
        myContactInfoList.append(myFriend1)
        myContactInfoList.append(myFriend2)
        myContactInfoList.append(myFriend3)
        myContactInfoList.append(myFriend4)
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myContactInfoList.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95.0
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        cell.imageView?.image = myContactInfoList[indexPath.row].contactImage
        cell.textLabel?.text = "\(myContactInfoList[indexPath.row].contactName) (\(myContactInfoList[indexPath.row].contactNickName))"
        cell.detailTextLabel?.text = "\(myContactInfoList[indexPath.row].contactPhoneNumber)"
        return cell
    }
 

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            myContactInfoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
