//
//  ViewController.swift
//  RateMyStudentDB
//
//  Created by ANT Man on 7/9/2562 BE.
//  Copyright © 2562 MO/IO. All rights reserved.
//

import UIKit
import CoreData

class RateStudentViewController: UIViewController {
    
    var theStudent: Student = Student()
    
    @IBOutlet weak var lblRatingScore: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBAction func addScoreMethod() {
        theStudent.addScore(ratingScore: 10)
        saveStudentRecord()
    }
    
    @IBAction func minusScoreMethod() {
        theStudent.minusScore(ratingScore: 10)
        saveStudentRecord()
    }
    
    @IBAction func resetScoreMethod() {
        theStudent.resetScore()
        saveStudentRecord()
    }
    
    func saveStudentRecord() -> Void {
        let myAppDelegate = UIApplication.shared.delegate as! AppDelegate
        let myContext = myAppDelegate.persistentContainer.viewContext
        
        let myFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"StudentTable")
        myFetchRequest.returnsObjectsAsFaults = false
        let myPredicate = NSPredicate(format: "studentName == %@", theStudent.studentName)
        myFetchRequest.predicate = myPredicate
        do{
            let myFetchResults = try myContext.fetch(myFetchRequest)
            if myFetchResults.count > 0 {
                let myResult = myFetchResults.first as! NSManagedObject
                //ปรับปรุงข้อมูลใน Object
                myResult.setValue(theStudent.studentName, forKey: "studentName")
                myResult.setValue(theStudent.studentRatingScore, forKey:
                    "studentRatingScore")
                let theImageData = theStudent.studentImage.pngData()! as NSData
                myResult.setValue(theImageData, forKey: "studentImage")
            }
        }catch let error as NSError{
            print(error.description)
        }
        do{
            try myContext.save()
        } catch let error as NSError{
            print(error.description)
        }
        self.navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = theStudent.studentName
        lblName.text = theStudent.studentName
        imgView.image = theStudent.studentImage
        lblRatingScore.text = "\(theStudent.studentRatingScore)"
    }

}

