//  Created by ANT Man on 10/8/2562 BE.
//  Copyright © 2562 Mossnana. All rights reserved.

import UIKit

// ต้องอย่าลืม inherit -> UIPickerViewDataSource และ UIPickerViewDelegate
class ContactViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    // สร้างตัวแปรที่จะเป็นข้อความในวงล้อ
    let contactType = ["Family", "Classmate", "Workmate", "Vendor"]
    let publicType = ["Private", "Work"]
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtNickname: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var pickerViewContactType: UIPickerView!
    // Action ในการกดปุ่ม
    @IBAction func saveContactInfoMethod(_ sender: Any) {
        let myContactType = contactType[pickerViewContactType.selectedRow(inComponent: 0)]
        let myPublicType = publicType[pickerViewContactType.selectedRow(inComponent: 1)]
        print("Contact: \(myContactType)")
        print("Public: \(myPublicType)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ทำให้ ViewController รู้จักกับวงล้อ contactType และ publicType
        pickerViewContactType.selectRow(2, inComponent: 0, animated: true)
        pickerViewContactType.selectRow(1, inComponent: 1, animated: true)
    }
    
    /* =================== Functions ที่ถูก inherit มาจาก PickerViewDataSource =================== */
    // กำหนดจำนวนวงล้อ
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    // จำนวนข้อมูลในแต่ละวงล้อของ PickerView
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let count: Int = component == 0 ? contactType.count : publicType.count
        return count
    }
    // เอาข้อมูลลง PickerView
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let dataInRow: String = component == 0 ? contactType[row] : publicType[row]
        return dataInRow
    }
}
