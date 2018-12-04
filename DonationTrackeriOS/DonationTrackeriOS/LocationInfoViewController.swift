//
//  LocationInfoViewController.swift
//  DonationTrackeriOS
//
//  Created by Abhay Tangella on 12/3/18.
//  Copyright © 2018 Abhay Tangella. All rights reserved.
//

import UIKit

class LocationInfoViewController: UIViewController {
    
    @IBOutlet weak var locationCity: UILabel!
    @IBOutlet weak var locationZip: UILabel!
    @IBOutlet weak var locationInfo: UILabel!
    @IBOutlet weak var locationAddress: UILabel!
    @IBOutlet weak var locationNumber: UILabel!
    @IBOutlet weak var locationType: UILabel!
    var information : String = ""
    var swag : String = ""
    var arr = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        //locationInfo?.text = information
        arr = swag.components(separatedBy: ",")
        locationInfo?.text = arr[0]
        locationType?.text = arr[1]
        locationAddress?.text = arr[5]
        locationCity?.text = arr[8]
        locationZip?.text = arr[2]
        locationNumber?.text = arr[3]

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is MapViewController {
            
            /*let selectedIndex = sender as! NSIndexPath
             let cell = tableView.cellForRow(at: selectedIndex as IndexPath)
             self.sendSelectedData = (cell.label?.text)! as String as NSString
             
             print(self.sendSelectedData) // till here it worked for me - it is filled with my label.text
             // I don't know what this is "viewController.labelcell", so you have to to know how to go on from here on
             
             viewController.labelcell = ([self.sendSelectedData as String])*/
            let vc = segue.destination as? MapViewController
            vc?.locationData = arr
            /*NSLog("Hi %i", selectedIndex)
            vc?.swag = trueswag[selectedIndex] as! String*/
            
        }
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
