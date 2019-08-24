import UIKit
import MobileCoreServices

class MyCameraViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var imgController :UIImagePickerController?
    var isNewImg = false
    
    @IBOutlet weak var imageArea: UIImageView!
    @IBOutlet weak var btnShare: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnShare.isHidden = false
    }
    
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
            let cancel = UIAlertAction(title: "My Camera App", style: .cancel, handler: nil)
            warning.addAction(cancel)
            self.present(warning, animated: true, completion: nil)
        }
    }
    
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
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        let theImage = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        imageArea.image = theImage
        btnShare.isHidden = false
    }
}

