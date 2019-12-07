//
//  MoMapAnnotation.swift
//  MyMapViewApp
//
//  Created by AntMan6 on 7/12/2562 BE.
//  Copyright © 2562 MO/IO. All rights reserved.
//

import UIKit
import MapKit

class MoMapAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var image = UIImage()
    
    override init() {
        self.coordinate = CLLocationCoordinate2D()
        self.title = ""
        self.subtitle = ""
        self.image = UIImage()
    }
}
