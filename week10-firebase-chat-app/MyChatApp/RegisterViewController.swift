//
//  RegisterViewController.swift
//  MyChatApp
//
//  Created by DrKeng on 10/12/2560 BE.
//  Copyright © 2560 ANT. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func registerMethod() {
        Auth.auth().createUser(withEmail: txtEmail.text!, password: txtPassword.text!, completion: {(user, error) in
            if error != nil {
                let alertController = UIAlertController(title: "Can't Signup", message: "\(error!)", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                self.present(alertController, animated: true, completion: nil)
            } else {
                let alertController = UIAlertController(title: "Signup Success", message: "Welcome to iChat", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Next", style: .default, handler: {(_ UIAlertAction) in
                    self.performSegue(withIdentifier: "chatSegue", sender: self)
                }))
                self.present(alertController, animated: true, completion: nil)
            }
        })
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
