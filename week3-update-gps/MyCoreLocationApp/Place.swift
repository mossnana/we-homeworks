//
//  Place.swift
//  MyCoreLocationApp
//
//  Created by  DrKen on 1/12/2561 BE.
//  Copyright © 2561  DrKen. All rights reserved.
//

import UIKit
import MapKit

class Place: NSObject, MKAnnotation {
    var title : String?
    var subtitle: String?
    var coordinate : CLLocationCoordinate2D
    
    init(title : String, subtitle : String, coordinate : CLLocationCoordinate2D){
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
