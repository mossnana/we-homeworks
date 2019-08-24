# Xcode 11 Beta 5 ต่อกับ Camera

## รูปแบบการใช้งาน กล้องถ่ายรูปในการถ่ายภาพเข้า Application

### Case Study

- กดถ่ายรูปในแอปเราแล้ว นำรูปที่ถ่ายมาแสดงบนแอป จากนั้นกดปุ่ม แชร์ออกไปยังนอกแอปได้
- เลือกรูปใน อัลบั้มมาแสดงบนแอป จากนั้น แชร์ออกไปยังนอกแอปได้เช่นกัน

### Methods

1. เพิ่มคำขออนุญาติใช้งานส่วนต่าง ๆในไฟล์ ***info.plist*** ดังนี้
   - Privacy - Photo Library Additions Usage Description : ขออนุญาติให้บันทึกรูปใหม่ลง Camera Roll ของเครื่องได้
   - Privacy - Photo Library Usage Description : ขออนุญาติใช้งาน Camera Roll
   - Privacy - Camera Usage Description : ขออนุญาติใช้งานกล้อง
2. สร้าง View Controller ใน Main Storyboard ที่เชื่อมโยงกับไฟล์ ViewController.swift
   1. สร้างปุ่มสำหรับเรียกใช้งานกล้อง ลากไปสร้าง IBAction ชื่อ "**cameraOpen**"
   2. สร้างปุ่มสำหรับเรียกใช้งาน Camera Roll ลากไปสร้าง IBAction ชื่อ "**albumOpen**"
   3. สร้างปุ่มสำหรับแชร์รูปภาพ ลากไปเป็นทั้ง IBOutlet ชื่อ "**btnShare**" และ IBAction ชื่อ "**share**"
3. ViewController.swift

```swift
import UIKit
import MobileCoreServices

/*
UINavigationControllerDelegate: ช่วยในการข้ามไปข้ามมาในระหว่างหน้าต่างๆ ตอนกำลังเปิดเลือกรูปใน Camera Roll
UIImagePickerControllerDelegate: ช่วยในการเปิดหน้าเลือกรูปใน Camera Roll
*/
class MyCameraViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    // สร้างหน้าที่จะเป็น หน้าเลือกรูปเปล่าๆ ไปก่อน
    var imgController :UIImagePickerController?
    var isNewImg = false
    
    // Outlet พื้นที่แสดงรูป
    @IBOutlet weak var imageArea: UIImageView!
    // Outlet ปุ่มแชร์
    @IBOutlet weak var btnShare: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ในครั้งแรกที่โหลดให้ซ่อนปุ่ม Share ก่อน เพราะยังไม่ได้เลือกรูป
        btnShare.isHidden = true
    }
    
    // Action ที่เกิดจากการกดปุ่ม เรียกใช้กล้อง
    @IBAction func camaraOpen(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imgController = UIImagePickerController()
            if let controller = imgController {
                controller.sourceType = .camera
                controller.mediaTypes =  [String(kUTTypeImage)]
                controller.allowsEditing = true
                controller.delegate = self
                present(controller, animated: true, completion: nil)
                isNewImg = true
            }
        } else {
            let warning = UIAlertController(title: "My Camera App", message: "Not Found Camera", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            warning.addAction(cancel)
            self.present(warning, animated: true, completion: nil)
        }
    }
    
    // Action ที่เกิดจากการกดเลือกรูปในอัลบั้ม
    @IBAction func albumOpen(_ sender: UIButton) {
        imgController = UIImagePickerController()
        if let controller = imgController {
            controller.sourceType = .photoLibrary
            controller.mediaTypes =  [String(kUTTypeImage)]
            controller.allowsEditing = true
            controller.delegate = self
            present(controller, animated: true, completion: nil)
            isNewImg = true
        }
    }
    
    // Action ที่เกิดจากการกดปุ่ม Share
    @IBAction func share(_ sender: Any) {
        let actItem: [AnyObject]? = [imageArea.image!]
        let actContrller = UIActivityViewController(activityItems: actItem!, applicationActivities: nil)
        actContrller.completionWithItemsHandler = {
            (actType, completed, resItems, error) in
            var res = ""
            if completed {
                if error == nil {
                    self.imageArea.image = nil
                    res = "Successful"
                } else {
                    res = "Unsuccessful"
                }
                let alert = UIAlertController(title: "Result", message: res, preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
            }
        }
        self.present(actContrller, animated: true, completion: nil)
    }
    
    // เหตุการณ์เมื่อผู้ใช้ยกเลิกการเลือกภาพ
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    // เหตุการณ์เมื่อผู้ใช้กดเลือกภาพเสร็จ
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        let theImage = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        imageArea.image = theImage
        btnShare.isHidden = false
    }
}

```

---

### Addition to ...

- จังหวะในการตรวจสอบว่าอุปกรณ์นั้น มีกล้องในตัวหรือไม่ ?

```swift
if UIImagePickerController.isSourceTypeAvailable(.camera){
    // ถ้ามี
} else {
   // ถ้าไม่มี
}
```

- ความแตกต่างในการตั้งค่าให้เป็นการเรียกใช้กล้องหรือ เรียกใช้อัลบั้ม

```swift
imgController = UIImagePickerController()
// สำหรับกล้อง
if let controller = imgController {
    controller.sourceType = .camera
}

// สำหรับอัลบั้ม
if let controller = imgController {
    controller.sourceType = .photoLibrary
}
```

