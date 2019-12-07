//
//  ViewController.swift
//  MyCoreLocationApp
//
//  Created by  DrKen on 1/12/2561 BE.
//  Copyright © 2561  DrKen. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var myMapView: MKMapView!
    @IBOutlet weak var lblLatitude: UILabel!
    @IBOutlet weak var lblLongitude: UILabel!
    @IBOutlet weak var lblHAccuracy: UILabel!
    @IBOutlet weak var lblAltitude: UILabel!
    @IBOutlet weak var lblVAccuracy: UILabel!
    @IBOutlet weak var lblDistance: UILabel!
    @IBAction func updateLocation(_ sender: Any) {
        locationManager.startUpdatingLocation()
    }
    
    let locationManager = CLLocationManager()
    var previousPoint : CLLocation?
    var totalMovementDistance : CLLocationDistance = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        let myError = error as! CLError
        let errorType = myError.code == CLError.denied ? "Access Denied" : "Error : \(myError.localizedDescription)"
        let alertController = UIAlertController(title: "Location Manager Error", message: errorType, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations[locations.count - 1]
        lblLatitude.text = "\(newLocation.coordinate.latitude)"
        lblLongitude.text = "\(newLocation.coordinate.longitude)"
        lblHAccuracy.text = "\(newLocation.horizontalAccuracy)"
        lblAltitude.text = "\(newLocation.altitude)"
        lblVAccuracy.text = "\(newLocation.verticalAccuracy)"
        
        
        if newLocation.horizontalAccuracy < 0 {
            return
        }
        if newLocation.horizontalAccuracy > 100 || newLocation.verticalAccuracy > 50 {
            return
        }
        
        if previousPoint == nil {
            totalMovementDistance = 0
            let startPoint = Place(title: "My Start Point", subtitle: "This is where we started", coordinate: newLocation.coordinate)
            myMapView.addAnnotation(startPoint)
        } else {
            print("Movement distance :\(newLocation.distance(from:previousPoint!))")
            totalMovementDistance += newLocation.distance(from:previousPoint!)
        }
        previousPoint = newLocation
        lblDistance.text = "\(totalMovementDistance) m"
        
        let region = MKCoordinateRegion(center: newLocation.coordinate, latitudinalMeters: 100, longitudinalMeters: 100)
        
        myMapView.setRegion(region, animated: true)
        myMapView.showsUserLocation = true
    }
    
}

