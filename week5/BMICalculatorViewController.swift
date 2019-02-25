//
//  ViewController.swift
//  bmi
//
//  Created by ANT MAN on 24/2/2562 BE.
//  Copyright © 2562 mossnana. All rights reserved.
//

import UIKit

class BMICalculatorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var txtWeight: UITextField!
    @IBOutlet weak var txtHeight: UITextField!
    @IBOutlet weak var txtViewResource: UITextView!
    
    @IBAction func bmiCalculationMethod() {
        
        // ซ่อน keyboard แบบ 1
        // txtWeight.resignFirstResponder
        // txtHeight.resignFirstResponder
        
        self.view.endEditing(true)
        
        let myWeight = Double(txtWeight.text!)!
        let myHeight = Double(txtHeight.text!)! / 100
        let myBMI: Double = myWeight / (myHeight * myHeight)
        let result = bmiResultInterpretation(myBMI)
        txtViewResource.text = result
    }
    
    @IBAction func clearContentMethod() {
        txtWeight.text = ""
        txtHeight.text = ""
        self.view.endEditing(true)
        
        txtWeight.becomeFirstResponder()
    }
    
    func bmiResultInterpretation(_ bmiValue : Double) -> String {
        var result : String = "ค่า BMI = \(bmiValue) \n"
        if bmiValue >= 40.0 {
            result += "คุณเป็นโรคอ้วนขึ้นสูงสุด กรุณาพบแพทย์ด่วน"
        }else if bmiValue >= 35.0 {
            result += "คุณเป็นโรคอ้วนระดับ 2 คุณเสี่ยงต่อการเกิดโรคที่มากับความอ้วนหากคุณมีเส้นรอบเอวมากกว่าเกณฑ์ปกติคุณจะเสี่ยงต่อการเกิดโรคสูง คุณต้องควบคุมอาหาร และออกกําลังกายอย่างจริงจัง"
        }else if bmiValue >= 28.5 {
            result += "คุณเป็นโรคอ้วนระดับ 1 และหากคุณมีเส้นรอบเอวมากกว่า 90 ซม.(ชาย) 80 ซม.(หญิง) คุณจะมีโอกาสเกิดโรคความดัน เบาหวานสูง จําเป็นต้องควบคุมอาหารและออกกําลังกาย"
        }else if bmiValue >= 23.5 {
            result += "น้ําหนักเกิน หากคุณมีกรรมพันธ์เป็นโรคเบาหวานหรือไขมันในเลือดสูงต้องพยายามลดน้ําหนักให้ดัชนีมวลกายต่ํากว่า 23"
        }else if bmiValue >= 18.5{
            result += "น้ําหนักปกติ และมีปริมาณไขมันอยู่ในเกณฑ์ปกติมักจะไม่ค่อยมีโรคร้ายอุบัติการณ์ของโรคเบาหวาน ความดันโลหิตสูงต่ํากว่าผู้ที่อ้วนกว่านี้"
        }else{
        result += "น้ําหนักน้อยเกินไป ซึ่งอาจจะเกิดจากนักกีฬาที่ออกกําลังกายมาก และได้รับสารอาหารไม่เพียงพอ วิธีแก้ไขต้องรับประทานอาหารที่มีคุณภาพ และมีปริมาณพลังงานเพียงพอ และออกกําลังกายอย่างเหมาะสม"
        }
    return result
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

