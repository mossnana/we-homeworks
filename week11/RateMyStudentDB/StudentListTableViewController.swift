//
//  StudentListTableViewController.swift
//  RateMyStudentDB
//
//  Created by ANT Man on 7/9/2562 BE.
//  Copyright © 2562 MO/IO. All rights reserved.
//

import UIKit
import CoreData

class StudentListTableViewController: UITableViewController {
    
    var myStudentList: [Student] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    override func viewWillAppear(_ animated: Bool) {
        myStudentList.removeAll()
        let myAppDelegate = UIApplication.shared.delegate as! AppDelegate
        let myContext = myAppDelegate.persistentContainer.viewContext
        
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "StudentTable")
        fetchReq.returnsObjectsAsFaults = false
        
        do {
            let fetchRes = try myContext.fetch(fetchReq)
            if fetchRes.count > 0 {
                for res in fetchRes as! [NSManagedObject] {
                    let myStudentName = res.value(forKey: "studentName") as! String
                    let myStudentScore = res.value(forKey: "studentRatingScore") as! Int
                    let myStudentImg = UIImage(data: res.value(forKey: "studentImage") as! Data)!
                    let stuObj = Student(studentName: myStudentName, studentRatingScore: myStudentScore, studentImage: myStudentImg)
                    myStudentList.append(stuObj)
                }
            }
        } catch let error as NSError {
            print(error.description)
        }
        self.tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let myAppDelegate = UIApplication.shared.delegate as! AppDelegate
        let myContext = myAppDelegate.persistentContainer.viewContext
        
        if editingStyle == .delete {
            let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "StudentTable")
            fetchReq.returnsObjectsAsFaults = false
            
            let myPredicate = NSPredicate(format: "studentName == %@", myStudentList[indexPath.row].studentName)
            fetchReq.predicate = myPredicate
            
            do {
                let fetchRes = try myContext.fetch(fetchReq)
                if fetchRes.count > 0 {
                    let result = fetchRes.first as! NSManagedObject
                    myContext.delete(result)
                }
            } catch let error as NSError {
                print(error.description)
            }
            
            myStudentList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            do {
                try myContext.save()
            } catch let error as NSError {
                print(error.description)
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myStudentList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath) as! StudentTableViewCell
        
        cell.stuNameOutlet.text = myStudentList[indexPath.row].studentName
        cell.stuContentOutlet.text = "\(myStudentList[indexPath.row].studentRatingScore)"
        if myStudentList[indexPath.row].studentRatingScore > 50 {
            cell.stuContentOutlet.textColor = UIColor(hue: 150, saturation: 99, brightness: 28, alpha: 1)
        } else {
            cell.stuContentOutlet.textColor = UIColor(hue: 360, saturation: 99, brightness: 28, alpha: 1)
        }
        cell.stuPictureOutlet.image = myStudentList[indexPath.row].studentImage
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
