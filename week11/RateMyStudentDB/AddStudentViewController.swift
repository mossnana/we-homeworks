//
//  AddStudentViewController.swift
//  RateMyStudentDB
//
//  Created by ANT Man on 7/9/2562 BE.
//  Copyright © 2562 MO/IO. All rights reserved.
//

import UIKit
import MobileCoreServices
import CoreData

class AddStudentViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var imgController: UIImagePickerController?
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtScore: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func albumMethod() {
        imgController = UIImagePickerController()
        if let theController = imgController {
            theController.sourceType = .savedPhotosAlbum
            theController.mediaTypes = [String(kUTTypeImage)]
            theController.allowsEditing = true
            theController.delegate = self
            present(theController, animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        let theImage = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        imgView.image = theImage
    }
    
    @IBAction func cameraMethod() {
        
    }
    
    @IBAction func ratingMethod() {
        let myAppDelegate = UIApplication.shared.delegate as! AppDelegate
        let myContext = myAppDelegate.persistentContainer.viewContext
        
        let newStudent = NSEntityDescription.insertNewObject(forEntityName: "StudentTable", into: myContext)
        newStudent.setValue(txtName.text!, forKey: "studentName")
        newStudent.setValue(Int(txtScore.text!), forKey: "studentRatingScore")
        let theImageData = imgView.image!.pngData()! as Data
        newStudent.setValue(theImageData, forKey: "studentImage")
        do {
            try myContext.save()
            print("saved")
            self.dismiss(animated: true, completion: nil)
        } catch {
            print("error to saved")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func cancelMethod() {
        self.dismiss(animated: true, completion: nil)
    }
  
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
