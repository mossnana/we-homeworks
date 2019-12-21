//
//  ViewController.swift
//  MyQRContactApp
//
//  Created by  DrKen on 1/12/2561 BE.
//  Copyright © 2561  DrKen. All rights reserved.
//

import UIKit

class ResultQRCodeViewController: UIViewController {

    @IBOutlet weak var txtViewResult: UITextView!
    
    @IBAction func clearContentMethod() {
        txtViewResult.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MyQRCodeContact"
    }


}

