//
//  DetailViewController.swift
//  MyMapViewApp
//
//  Created by AntMan6 on 7/12/2562 BE.
//  Copyright © 2562 MO/IO. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var info: MoMapAnnotation = MoMapAnnotation()
    var myLocationName = ""
    
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var subLocationName: UILabel!
    @IBOutlet weak var imageName: UIImageView!
    @IBOutlet weak var position: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = info.title!
        self.locationName.text = info.title!
        self.imageName.image = info.image
        self.position.text = "\(String(info.coordinate.latitude)) \(String(info.coordinate.longitude))"
        self.subLocationName.text = "\(info.subtitle ?? "None")"
    }
}
