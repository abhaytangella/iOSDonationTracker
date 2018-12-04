//
//  MapViewController.swift
//  
//
//  Created by Abhay Tangella on 12/3/18.
//

import UIKit
import MapKit

class MyAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var subtitle: String?
    var title: String?
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationData = [String]()
    var locationManager: CLLocationManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
        
        let lat = Double(locationData[7])
        let long = Double(locationData[6])
        //let intialLocation = CLLocation(latitude: lat!, longitude: long!)
        //centerMaponLocation(location: intialLocation)
        
        let CLLCoordType = CLLocationCoordinate2D(latitude: lat!, longitude: long!);
        //let anno = MKPointAnnotation();
        //anno.coordinate = CLLCoordType;
        
        let pin = MyAnnotation(coordinate: CLLCoordType)
        pin.title = locationData[0]
        pin.subtitle = locationData[5]
        mapView.addAnnotation(pin)
        

        // Do any additional setup after loading the view.
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        let userLocation:CLLocation = locations[0] as! CLLocation
        
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        mapView.setRegion(region, animated: true)
        
        // Drop a pin at user's Current Location
        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
        myAnnotation.coordinate = CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude);
        print("latitude")
        print(userLocation.coordinate.latitude)
        print("longitude")
        print(userLocation.coordinate.longitude)
        
        myAnnotation.title = "Current location"
        mapView.addAnnotation(myAnnotation)
    }
}
