/*
ViewController.swift
*/

import UIKit

class ViewController: UIViewController {

/*
IB = Interface Bulider
IBOutlet คือตัวเชื่อมระหว่าง Variable กับ UI บน Interface
*/
@IBOutlet weak var myTextField: UITextField!
@IBOutlet weak var lblResult: UILabel!

/*
IBAction คือตัว function ของ UI
*/
@IBAction func buttonPress(_ sender: Any) {
  // .text เป็น attibute เปลี่ยนค่า Label ใน UI เช่น TextView, Label
  lblResult.text = myTextField.text
  myTextField.text = ""
}

@IBAction func clearText(_ sender: Any) {
  lblResult.text = ""
  myTextField.text = ""
}

override func viewDidLoad() {
super.viewDidLoad()
// Do any additional setup after loading the view, typically from a nib.
}

}
