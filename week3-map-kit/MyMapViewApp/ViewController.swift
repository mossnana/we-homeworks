//
//  ViewController.swift
//  MyMapViewApp
//
//  Created by AntMan6 on 7/12/2562 BE.
//  Copyright © 2562 MO/IO. All rights reserved.
//

import UIKit
// เนื่องจาก MapKitView UI ไม่อยู่ใน UI Kit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mainMapView: MKMapView!
    
    // กำหนด AnnotationView เอง
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"
        var annoView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if annoView == nil {
            annoView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annoView?.canShowCallout = true
        }
        let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
        let v = annotation as! MoMapAnnotation
        leftIconView.image = v.image
        annoView!.leftCalloutAccessoryView = leftIconView
        
        let infoButton = UIButton(type: .detailDisclosure)
        annoView!.rightCalloutAccessoryView = infoButton
        
        return annoView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        performSegue(withIdentifier: "detailSegue", sender: view)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let v = sender as! MKPinAnnotationView
        let destinationVC = segue.destination as! DetailViewController
        destinationVC.info = v.annotation as! MoMapAnnotation
    }
    
    // กำหนดรูปแบบเส้นทางเอง
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 4.0
        return renderer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* กำหนดตัวผู้ช่วยของแผนที่ */
        mainMapView.delegate = self
        
        /* กำหนดจุดในแผนที่ */
        let myHome = MoMapAnnotation()
        let myOffice = MoMapAnnotation()
        
        myHome.coordinate = CLLocationCoordinate2DMake(13.816970, 100.596799)
        myHome.title = "My Home"
        myHome.subtitle = "Very Cool !!"
        myHome.image = UIImage(named: "myHome")!
        
        myOffice.coordinate = CLLocationCoordinate2DMake(13.7722376, 100.6766373)
        myOffice.title = "My Office"
        myOffice.subtitle = "Netforce (Thailand) Ltd."
        myOffice.image = UIImage(named: "netforce")!
        
        var locationList: [MoMapAnnotation] = []
        locationList.append(myHome)
        locationList.append(myOffice)
        
        mainMapView.showAnnotations(locationList, animated: true)
        mainMapView.selectAnnotation(myHome, animated: true)
        
        /* สร้างเส้นทางให้กับแผนที่ */
        /* กำหนดจุดเริ่มและจุดสิ้นสุดในการเดินทาง */
        let startPoint = MKPlacemark(coordinate: myHome.coordinate)
        let endPoint = MKPlacemark(coordinate: myOffice.coordinate)
        /* กำหนดวัตถุในการใช้นำทาง */
        let startMapObject = MKMapItem(placemark: startPoint)
        let endMapObject = MKMapItem(placemark: endPoint)
        let directionRequest = MKDirections.Request()
        directionRequest.source = startMapObject
        directionRequest.destination = endMapObject
        // กำหนดวิธีการเดินทาง
        directionRequest.transportType = .walking
        let directions = MKDirections(request: directionRequest)
        directions.calculate { (res, err) in
            guard res != nil else {
                if err != nil {
                    print("Error")
                }
                return
            }
            let route = res?.routes[0]
            let routeArea = route?.polyline.boundingMapRect
            self.mainMapView.addOverlay((route?.polyline)!, level: .aboveRoads)
            self.mainMapView.setVisibleMapRect(routeArea!, edgePadding: UIEdgeInsets(top: 45.0, left: 45.0, bottom: 45.0, right: 45.0), animated: true)
        }
    }
}

