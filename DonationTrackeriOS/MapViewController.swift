//
//  MapViewController.swift
//  
//
//  Created by Abhay Tangella on 12/3/18.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let intialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        centerMaponLocation(location: intialLocation)

        // Do any additional setup after loading the view.
    }
    let regionRadius: CLLocationDistance = 1000
    func centerMaponLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
