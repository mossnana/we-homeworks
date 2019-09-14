//
//  MainViewController.swift
//  MyWebServiceApp
//
//  Created by  DrKen on 16/11/2561 BE.
//  Copyright © 2561  DrKen. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // Constrains
    @IBOutlet weak var signInBottomConstrain: NSLayoutConstraint!
    @IBOutlet weak var imgCenterConstrain: NSLayoutConstraint!
    // UI
    @IBOutlet weak var signInOutlet: UIButton!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    // Actions
    @IBAction func loginMethod() {
        print("test")
        self.saveUserName()
        //HTTP request initialization
        let myURL : URL = URL(string: "http://www.worasit.com/iosbuilder/login.php")!
        var myRequest : URLRequest = URLRequest(url: myURL)
        let mySession = URLSession.shared
        myRequest.httpMethod = "POST"
        //Initialized parameter
        let params = ["username":"\(txtUsername.text!)", "password":"\(txtPassword.text!)"] as Dictionary<String, String>
            myRequest.httpBody = try! JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
            myRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            myRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        let myTask = mySession.dataTask(with: myRequest)
        {(responseData, responseStatus, error) in
            OperationQueue.main.addOperation({
                print("responseStatus = \(responseStatus!)")
                print("responseData = \(responseData!)")
                print("test")
                self.parseJSON(myData: responseData!)
            })
        }
        print("test")
        myTask.resume()
    }
    
    func adjustHeight(_ show: Bool, notification: NSNotification) {
        var userInfo = notification.userInfo!
        
        let keyboardFrame:CGSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
        if show {
            UIView.animate(withDuration: 0.5) {
                //ขยับปุ่ม Sign in ตามขนาดความสูงของ Keyboard - 20
                //ขยับรูปการ์ตูน ตามขนาดความสูงของปุ่ม Sign In + 20
                self.signInBottomConstrain.constant -= keyboardFrame.height - 20
                self.imgCenterConstrain.constant -= self.signInOutlet.frame.height + 20
                self.view.layoutIfNeeded()
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                //กําหนดค่าเดิมตาม Constraint ที่ผูกไว้ตั้งแต่ต้น
                self.signInBottomConstrain.constant = -20
                self.imgCenterConstrain.constant = 0
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func keyboardWillShow(notification:NSNotification) {
        adjustHeight(true, notification: notification)
        NotificationCenter.default.removeObserver(self, name:
            UIWindow.keyboardWillShowNotification, object: nil)
    }
    @objc func keyboardWillHide(notification:NSNotification) {
        adjustHeight(false, notification: notification)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIWindow.keyboardWillShowNotification , object:
            nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIWindow.keyboardWillShowNotification , object:
            nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIWindow.keyboardWillHideNotification, object: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name:
            UIWindow.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name:
            UIWindow.keyboardWillHideNotification, object: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        txtUsername.text = defaults.string(forKey: "myUserName")
        // Do any additional setup after loading the view, typically from a nib.
    }

    func saveUserName(){
        let defaults : UserDefaults = UserDefaults.standard
        defaults.set(txtUsername.text!, forKey: "myUserName")
    }
    
    func parseJSON(myData : Data){
        let json = try! JSONSerialization.jsonObject(with: myData, options: .mutableContainers)
        let loginResults = json as! [[String : String]]
        var myResult : String = ""
        if loginResults.count > 0 {
            myResult = loginResults.first!["myResult"]!
            if myResult == "OK" {
                let vc = self.storyboard?.instantiateViewController(withIdentifier:"MediaListTBV") as! MediaListTableViewController
                let navigationController = UINavigationController(rootViewController: vc)
                navigationController.navigationBar.barTintColor = UIColor.darkGray
                navigationController.navigationBar.tintColor = UIColor.white
                navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
                self.present(navigationController, animated: true, completion: nil)
            }
            else{
                let alertController = UIAlertController(title: "เกิดข้อผิดพลาด", message: "กรุณาตรวจสอบ Username และ Password ให้ถูกต้อง", preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: .default, handler:
                    nil)
                alertController.addAction(okButton)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
}

