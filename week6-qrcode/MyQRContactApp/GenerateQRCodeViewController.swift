//
//  GenerateQRCodeViewController.swift
//  MyQRContactApp
//
//  Created by  DrKen on 1/12/2561 BE.
//  Copyright © 2561  DrKen. All rights reserved.
//

import UIKit

class GenerateQRCodeViewController: UIViewController {
    
    @IBOutlet weak var txtContactName: UITextField!
    @IBOutlet weak var txtContactNumber: UITextField!
    @IBOutlet weak var btnQRCode: UIButton!
    
    @IBOutlet weak var imgQRCode: UIImageView!
    
    var QrCodeImage: CIImage?
    
    @IBAction func qrCodeGenerateMethod() {
        if QrCodeImage == nil {
            self._qrCodeGenerateMethod()
        } else {
            self._resetAll()
        }
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtContactName.delegate = self
        txtContactNumber.delegate = self
    }
    
    func getContractInfo() -> String {
        var contactInfo: String = ""
        contactInfo = "Name:\(txtContactName.text!)\nContact:\(txtContactNumber.text!)"
        return contactInfo
    }
    
    func _qrCodeGenerateMethod() {
        let isNameEmpty = (txtContactName.text?.isEmpty)!
        let isNumberEmpty = (txtContactNumber.text?.isEmpty)!
        if (!isNameEmpty && !isNumberEmpty) {
            let data = self.getContractInfo().data(using: .utf8)
            let filter = CIFilter(name: "CIQRCodeGenerator")
            filter?.setValue(data, forKey: "inputMessage")
            // L, M, Q, H
            filter?.setValue("Q", forKey: "inputCorrectionLevel")
            QrCodeImage = filter?.outputImage
            let scaledQrCodeImage = adjustQrCodeScale(QrCode: QrCodeImage!)
            imgQRCode.image = UIImage(ciImage: scaledQrCodeImage)
            btnQRCode.setTitle("Clear QR Code", for: .normal)
        }
    }
    
    func adjustQrCodeScale(QrCode: CIImage) -> CIImage {
        let scaleX = imgQRCode.frame.size.width / (QrCodeImage?.extent.size.width)!
        let scaleY = imgQRCode.frame.size.height / (QrCodeImage?.extent.size.height)!
        let transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
        let scaledQrCodeImage = QrCode.transformed(by: transform)
        return scaledQrCodeImage
    }
    
    func _resetAll() {
        imgQRCode.image = nil
        QrCodeImage = nil
        txtContactNumber.text = ""
        txtContactName.text = ""
        btnQRCode.setTitle("Gennerate QR Code", for: .normal)
    }
}

extension GenerateQRCodeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtContactName.resignFirstResponder()
        txtContactNumber.resignFirstResponder()
        return true
    }
}
