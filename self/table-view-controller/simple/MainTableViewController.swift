//
//  MainTableViewController.swift
//  MyContactList
//
//  Created by ANT Man on 10/8/2562 BE.
//  Copyright © 2562 Mossnana. All rights reserved.
//

import Foundation
import UIKit

// inherit UITableViewController มาเพราะตอนนี้เรากำลังใช้ UITableViewController
class MainTableViewController: UITableViewController {
    // สร้างตัวแปร myContactInfoList ซึ่งเป็นตัวแปรที่เก็บค่า ContactInformation
    // ค่า ContactInformation เป็นค่าที่กำหนดเองที่มาจาก class ContactInformation ที่เป็น Cocoa Framework
    var myContactInfoList: [ContactInformation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Main List"
        // สร้างข้อมูลปลอมๆ ขึ้นมาทดสอบ
        let myFriend_1: ContactInformation = ContactInformation(contactName: "Permpoon Chaowanaphunphon", contactNickname: "Perm", contactPhoneNumber: "080-677-5134", contactType: 0, contactPublicType: 0, contactImage: UIImage(named: "b1.jpg")!)
        let myFriend_2: ContactInformation = ContactInformation(contactName: "Wirawhorn Wannasorn", contactNickname: "Kloy", contactPhoneNumber: "08X-XXX-XXXX", contactType: 0, contactPublicType: 0, contactImage: UIImage(named: "b2.jpg")!)
        // เอาข้อมูลเก็บไว้ใน Array -> ContactInformation
        myContactInfoList.append(myFriend_1)
        myContactInfoList.append(myFriend_2)
    }
    
    
    /*
     =============================== function กำหนดหน้าตา Table View ===============================
     จะเริ่มจาก กำหนดใหญ่ไปเล็ก
     1. numberOfSections: ใส่จำนวนตาราง
     2. tableView(... numberOfRowsInSection section: Int) : ใส่จำนวนแถวในแต่ละตาราง
     3. tableView(... cellForRowAt indexPath: IndexPath) : ใส่ข้อมูลในแต่ละแถว
     4. tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) : Action ต่างๆ ในแถว
     */
    // จำนวน Table View  ใน View Controller นี้
    // ถ้าใช้เป็นตัว Table View Controller เลยแล้วใส่ numberOfSections เป็น 2 จะวนข้อมูลแถว 2 ครั้งใน ตารางเดียว ซึ่งไม่ดีแน่ !!!
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // บอกจำนวนแถวใน Table View นี้
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myContactInfoList.count
    }
    
    //  ใส่ข้อมูลรายแถว
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.imageView?.image = myContactInfoList[indexPath.row].contactImage
        cell.textLabel?.text = "\(myContactInfoList[indexPath.row].contactName) [\(myContactInfoList[indexPath.row].contactNickname)]"
        cell.detailTextLabel?.text = "\(myContactInfoList[indexPath.row].contactPhoneNumber)"
        return cell
    }
    // การลบข้อมูล
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myContactInfoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
}
