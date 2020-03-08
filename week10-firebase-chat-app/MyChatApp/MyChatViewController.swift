//
//  MyChatViewController.swift
//  MyChatApp
//
//  Created by DrKeng on 10/12/2560 BE.
//  Copyright © 2560 ANT. All rights reserved.
//

import UIKit
import Firebase

class MyChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"Cell", for: indexPath) as! MessageTableViewCell
        cell.myChatMessage.text = messageList[indexPath.row].message
        cell.myChatSender.text = messageList[indexPath.row].sender
        if cell.myChatSender.text == Auth.auth().currentUser?.email as String?{
            cell.myImage.image = nil
            cell.myChatSender.textAlignment = .right
            cell.myChatMessage.textAlignment = .right
            cell.myChatView.backgroundColor = UIColor(red: 255.0/255.0,
                                                      green: 212.0/255.0, blue: 121.0/255.0, alpha: 1.0)
        }else {
            cell.myImage.image = UIImage(named: "avatar")
            cell.myChatSender.textAlignment = .left
            cell.myChatMessage.textAlignment = .left
            cell.myChatView.backgroundColor = UIColor(red: 102.0/255.0,
                                                      green: 204.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        }
        return cell
    }
    
    
    @IBOutlet weak var heightContraint: NSLayoutConstraint!
    @IBOutlet weak var txtMessage: UITextField!
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var chatTableView: UITableView!
    // Keyboard Size
    var keyboardSize: CGSize = CGSize()
    var messageList: [Message] = []
    
    @IBAction func submitMethod() {
        txtMessage.endEditing(true)
        txtMessage.isEnabled = false
        btnSend.isEnabled = false
        
        let messageDB = Database.database().reference().child("messages")
        let messageDict = ["sender": Auth.auth().currentUser!.email, "body": txtMessage.text!]
        messageDB.childByAutoId().setValue(messageDict, withCompletionBlock: {(error, ref) in
            if error != nil {
                let alertController = UIAlertController(title: "Error to send a message", message: "\(error)", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                self.present(alertController, animated: true, completion: nil)
                self.txtMessage.isEnabled = true
                self.btnSend.isEnabled = true
            } else {
                self.txtMessage.isEnabled = true
                self.btnSend.isEnabled = true
                self.txtMessage.text = ""
            }
        })
    }
    
    
    @IBAction func logoutMethod(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        }catch{
            let alertController = UIAlertController(title: "Can't Signout", message: "Can't Signout", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func receivingMethod() {
        let messageDB = Database.database().reference().child("messages")
        messageDB.observe(.childAdded, with: {(snapshot) in
            let receievedMessage = Message()
            receievedMessage.receiveFromSnapshotValue(data: snapshot)
            self.messageList.append(receievedMessage)
            self.configureTableView()
            self.chatTableView.reloadData()
            let indexPath = IndexPath(row: self.messageList.count - 1, section: 0)
            self.chatTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatTableView.dataSource = self
        chatTableView.delegate = self
        txtMessage.delegate = self
        
        configureTableView()
        receivingMethod()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        chatTableView.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }
    
    @objc func tableViewTapped() {
        txtMessage.endEditing(true)
    }
    
    func configureTableView() {
        chatTableView.rowHeight = UITableView.automaticDimension
        chatTableView.estimatedRowHeight = 125
        chatTableView.separatorStyle = .none
    }
    
    func numberOfSections() {
        
    }
    
    @objc func keyboardWillShow(notification:NSNotification) {
        let userInfo = notification.userInfo!
        keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
        
        UIView.animate(withDuration: 0.3) {
            self.heightContraint.constant = self.keyboardSize.height + 14
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIWindow.keyboardWillShowNotification , object: nil)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3) {
            self.heightContraint.constant = 44
            self.view.layoutIfNeeded()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtMessage.endEditing(true)
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
