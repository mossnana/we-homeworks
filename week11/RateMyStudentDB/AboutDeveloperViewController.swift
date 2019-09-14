//
//  File.swift
//  RateMyStudentDB
//
//  Created by ANT Man on 14/9/2562 BE.
//  Copyright © 2562 MO/IO. All rights reserved.
//

import UIKit
import WebKit


class AboutDeveloperViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myWebView.navigationDelegate = self
        let myURL = URL(string: "https://mossnana.github.io/resume")
        let myRequest = URLRequest(url: myURL!)
        myWebView.load(myRequest)
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation
        navigation: WKNavigation!, withError error: Error) {
        let alertController = UIAlertController(title: "เกิดข้อผิดพลาด", message: "ไม่สามารถเชื่อมต่ออินเทอร์เน็ตได้", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        { (action) -> Void in
            exit(0)
        }
        alertController.addAction(okButton)
        self.present(alertController, animated: true, completion: nil)
    }
}
