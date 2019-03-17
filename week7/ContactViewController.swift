//
//  ViewController.swift
//  MyContactView
//
//  Created by ANT MAN on 17/3/2562 BE.
//  Copyright © 2562 mossnana.com. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerViewController.dataSource = self
        pickerViewController.delegate = self
        
        pickerViewController.selectRow(2, inComponent: 0, animated: true)
        pickerViewController.selectRow(1, inComponent: 1, animated: true)
    }

    // Picker View Data
    let contactType = ["Family", "High School", "Work", "Customer"]
    let publicType = ["Private", "Work"]
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtNickName: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    // Picker View Ref.
    @IBOutlet weak var pickerViewController: UIPickerView!
    
    @IBAction func saveContactInfoMethod() {
        let myContactType = contactType[pickerViewController.selectedRow(inComponent: 0)]
        let myPublicType = publicType[pickerViewController.selectedRow(inComponent: 1)]
        
        print("Save !!!")
        print(txtName.text!)
        print(txtNickName.text!)
        print(myContactType)
        print(myPublicType)
    }
    // Picker View Number Method -> want 2 Picker View
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    @IBAction func cancel(_ sender: Any) {
        txtName.text = ""
        txtNickName.text = ""
        txtPhoneNumber.text = ""
        txtName.becomeFirstResponder()
        txtName.resignFirstResponder
        txtNickName.resignFirstResponder
        pickerViewController.selectRow(0, inComponent: 0, animated: true)
        pickerViewController.selectRow(0, inComponent: 1, animated: true)
    }
    // order Picker View data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return contactType.count
        }else{
            return publicType.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return contactType[row]
        }else{
            return publicType[row]
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

