import UIKit
import MobileCoreServices
import CoreData

class User {
    /*  Attributes */
    var id: Int
    var firstName: String
    var lastName: String
    var email: String
    var role: String
    var recentLogin: String
    
    /* Init Method */
    init(
        id: Int,
        firstName: String,
        lastName: String,
        email: String,
        role: String,
        recentLogin: String
    ) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.role = role == "" ? "member": role
        self.recentLogin = recentLogin == "" ? "unrecorded": recentLogin
    }
    convenience init(id: Int, firstName: String, lastName: String, email: String) {
        self.init(
            id: id,
            firstName: firstName,
            lastName: lastName,
            email: email,
            role: "",
            recentLogin: ""
        )
    }
    func userInfo() -> [String: Any] {
        let userInfo = [
            "id": self.id,
            "firstName": self.firstName,
            "lastName": self.lastName,
            "email": self.email,
            "role": self.role,
            "recentLogin": self.recentLogin
        ] as [String : Any]
        return userInfo
    }
}

/* Member */
class Member: User {
    override func userInfo() -> [String : Any] {
        let userInfo = [
            "id": self.id,
            "firstName": self.firstName,
            "lastName": self.lastName,
            "email": self.email
        ] as [String: Any]
        return userInfo
    }
}

// Add User view controller.swift
class addUserViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var myImgController: UIImagePickerController?
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var txtUserId: UITextField!
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    // Action When Click Select Image
    @IBAction func selectImgAction() {
        myImgController = UIImagePickerController()
        if let theController = myImgController {
            theController.sourceType = .savedPhotosAlbum
            theController.mediaTypes = [String(kUTTypeImage)]
            theController.allowsEditing = true
            theController.delegate = self
            present(theController, animated: true, completion: nil)
        }
    }
    // When cancel image picker
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    // When finished image picker
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // close album controller
        picker.dismiss(animated: true, completion: nil)
        // bring choosed image show in my UIImage
        let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        imgView.image = selectedImage
    }
    // Cancel Button
    @IBAction func cancelAction() {
        self.dismiss(animated: true, completion: nil)
    }
    // Save Button
    @IBAction func saveAction() {
        // create Object of AppDelegate for call persistantContainer
        // No AppDelegate.swift file
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let myContext = appDelegate.persistentContainer.viewContext
        // Prepare Data Application
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "userInfo", into: myContext)
        let imgData = imgView.image!.pngData()! as Data
        newUser.setValue(txtUserId.text!, forKey: "userId")
        newUser.setValue(txtFirstName.text!, forKey: "firstName")
        newUser.setValue(txtLastName.text!, forKey: "lastName")
        newUser.setValue(txtEmail.text!, forKey: "email")
        
        // Save Data to Database
        do {
            try myContext.save()
            print("Save Context Successful")
        } catch {
            print("Can't Save Context to Database")
        }
        self.dismiss(animated: true, completion: nil)
    }
}

// User List table view controller.swift
class userListTableViewController: UITableViewController {
    var userList : [User] = []
    // View Controller Life Cycle 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "User lists"
    }
    override func viewWillAppear(_ animated: Bool) {
        // Clear List before show again
        userList.removeAll()
    }
    // Create Object from AppDelegate 
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let myContext = appDelegate.persistentContainer.viewContext
    
    // call database
    let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "userInfo")
    fetchReq.returnsObjectsAsFaults = false
    let fetchRes = try myContext.fetch(fetchReq)
}

/* Main Class */
print("Hello World")

