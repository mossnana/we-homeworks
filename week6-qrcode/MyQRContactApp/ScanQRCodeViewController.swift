//
//  ScanQRCodeViewController.swift
//  MyQRContactApp
//
//  Created by  DrKen on 1/12/2561 BE.
//  Copyright © 2561  DrKen. All rights reserved.
//

import UIKit
import AVFoundation

class ScanQRCodeViewController: UIViewController {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var lblResult: UILabel!
    @IBAction func backMethod() {
        self.dismiss(animated: true, completion: nil)
    }
    var captureSession : AVCaptureSession?
    var videoPreviewLayer : AVCaptureVideoPreviewLayer?
    var qrCodeFrameView : UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        //สร้างตัวแปรแทน AVCaptureDeviceInput
        var inputDevice : AVCaptureDeviceInput?
        do{
            inputDevice = try AVCaptureDeviceInput(device: captureDevice!)
        }catch let error as NSError {
            print(error.description)
            return
        }
        //เริ่ม Session การอ่าน QRCode
        captureSession = AVCaptureSession()
        //กําหนด InputDevice ให้กับ captureSession
        captureSession?.addInput(inputDevice!)
        //สร้างตัวแปรแทน AVCaptureMetadataOutput
        let captureMetadataOutput = AVCaptureMetadataOutput()
        captureSession?.addOutput(captureMetadataOutput)
        captureMetadataOutput.setMetadataObjectsDelegate(self, queue:DispatchQueue.main)
        captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        //สร้าง Video Preview Layer และนําไปใส่ไว้ที่ View หลัก
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        videoPreviewLayer?.frame = view.layer.bounds
        view.layer.addSublayer(videoPreviewLayer!)
        //ย้าย headerView และ lblResult มาไว้ด้านหน้า
        view.bringSubviewToFront(headerView)
        view.bringSubviewToFront(lblResult)
        //ใส่ Frame เพื่อ hightlight ระหว่าง Scan QRCode
        qrCodeFrameView = UIView()
        qrCodeFrameView?.layer.borderColor = UIColor.red.cgColor
        qrCodeFrameView?.layer.borderWidth = 4
        view.addSubview(qrCodeFrameView!)
        view.bringSubviewToFront(qrCodeFrameView!)
        //เริ่ม Capture QRCode
        captureSession?.startRunning()
    }
}

extension ScanQRCodeViewController :
AVCaptureMetadataOutputObjectsDelegate{
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput
        metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection)
    {
        //ตรวจสอบว่าพบ QRCode หรือไม่ โดยดูที่จํานวน metadataObjects
        if metadataObjects.count != 0{
            //อ่านค่า MetaDataObjects ที่ได้มา
            let metadataObj = metadataObjects[0] as!
            AVMetadataMachineReadableCodeObject
            //ตรวจสอบว่าเป็น QR Code หรือไม่
            if metadataObj.type == AVMetadataObject.ObjectType.qr{
                let qrCodeObject =
                    videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
                qrCodeFrameView?.frame = (qrCodeObject?.bounds)!
                //ถ้าพบข้อมูลให้นําไปแสดงที่ Label และหยุดการ Scan
                if metadataObj.stringValue != nil {
                    lblResult.text = metadataObj.stringValue
                    captureSession?.stopRunning()
                }
            }
        }
        else{
            qrCodeFrameView?.frame = CGRect.zero
            lblResult.text = "ยังไม่สามารถตรวจจับ QR Code ได้"
        }
    }
}
