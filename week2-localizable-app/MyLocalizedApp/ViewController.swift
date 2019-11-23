import UIKit

class ViewController: UIViewController {
    // ตัวแปรสำหรับ การแปลภาษา Variables for Translate
    // พารามิเตอร์ comment สามารถปล่อยว่างได้โดยไม่มีผลต่อตัวแอป comment can be nil.
    let alertTitle = NSLocalizedString("DPU", comment: "")
    let alertMessage = NSLocalizedString("Thank you for your comments and suggestions", comment: "")
    let cancelString = NSLocalizedString("Cancel", comment: "")
    let okString = NSLocalizedString("OK", comment: "")
    let appTitle = NSLocalizedString("MY DPU", comment: "")
    
    @IBOutlet weak var lblComment: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblContact: UILabel!
    @IBOutlet weak var btnSubmit: UIButton!
    
    @IBAction func submitMethod() {
        // Create Alert Box and Action button
        // ตัวแปร alertTitle, alertMessage, cancelString, okString ใช้แทน String ได้เลย
        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let cancelBtn = UIAlertAction(title: cancelString, style: .cancel, handler: nil)
        let okBtn = UIAlertAction(title: okString, style: .default, handler: nil)
        // Add Action button in Alert Box
        alertController.addAction(cancelBtn)
        alertController.addAction(okBtn)
        // Tiggle Alert box
        present(alertController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // ตัวแปร appTitle ที่เป็น NSLocalizedString สามารถใช้แทน String ไปได้เลย
        self.title = appTitle
    }
}

