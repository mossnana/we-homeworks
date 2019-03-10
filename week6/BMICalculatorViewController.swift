import UIKit

class BMICalculatorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func errorMessageAlertMethod(_ errorMessage: String){
        // สร้าง Textbox แจ้งเตือน
        // preferredStyle: .actionSheet -> กล่องแจ้งเตือนด้านล่าง
        // preferredStyle: .alert -> กล่องแจ้งเตือนตรงกลาง
        let alertController = UIAlertController(title: "BMI Calculator", message: errorMessage, preferredStyle: .alert)
        
        // สร้าง function ให้กับปุ่ม
        // ปุ่ม Cancel มีได้ปุ่มเดียว
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        // ปุ่ม Default มีได้หลายอัน
        let clearButton = UIAlertAction(title: "Clear", style: .default, handler: { (action) in
            self.txtHeight.text = ""
            self.txtWeight.text = ""
            self.txtViewResource.text = ""
            self.txtWeight.becomeFirstResponder()
        })
        // การเขียน Action ปุ่มอีกแบบ
        let newButton = UIAlertAction(title: "Destructive", style: .destructive) {(action) in
            print("New Button")
        }
        
        // เพิ่ม Action ให้กลับปุ่ม
        alertController.addAction(cancelButton)
        alertController.addAction(clearButton)
        alertController.addAction(newButton)
        
        // แสดง AlertController Object
        self.present(alertController, animated: true, completion: nil)
    }

    // Object Reference
    @IBOutlet weak var txtWeight: UITextField!
    @IBOutlet weak var txtHeight: UITextField!
    @IBOutlet weak var txtViewResource: UITextView!
    
    // Main Logic
    @IBAction func bmiCalculationMethod() {
        
        // ซ่อน keyboard แบบ 1
        // txtWeight.resignFirstResponder
        // txtHeight.resignFirstResponder
        
        // ซ่อน keyboard แบบที่ 2
        self.view.endEditing(true)
        
        if(((txtWeight.text?.isEmpty)!) || ((txtHeight.text?.isEmpty)!)){
            errorMessageAlertMethod("Please Input Number !!!")
        }else{
            let myWeight = Double(txtWeight.text!)
            var myHeight = Double(txtHeight.text!)
            if((myWeight != nil) && (myHeight != nil)){
                myHeight = Double(txtHeight.text!)! / 100
                let myBMI: Double = myWeight! / (myHeight! * myHeight!)
                let result = bmiResultInterpretation(myBMI)
                txtViewResource.text = result
            }else{
                errorMessageAlertMethod("Input Number Only !!!")
            }
            txtWeight.resignFirstResponder()
            txtHeight.resignFirstResponder()
        }
        
        /*
         Week 5 Code งานเก่า
         let myWeight = Double(txtWeight.text!)!
         let myHeight = Double(txtHeight.text!)! / 100
         let myBMI: Double = myWeight / (myHeight * myHeight)
         let result = bmiResultInterpretation(myBMI)
         txtViewResource.text = result
        */
        
    }
    
    // Clear Textbox
    @IBAction func clearContentMethod() {
        txtWeight.text = ""
        txtHeight.text = ""
        self.view.endEditing(true)
        txtWeight.becomeFirstResponder()
    }
    
    // Calculation Function
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
    
    // Override Function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

