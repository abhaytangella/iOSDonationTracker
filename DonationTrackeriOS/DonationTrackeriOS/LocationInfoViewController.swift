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

    override func viewDidLoad() {
        super.viewDidLoad()
        //locationInfo?.text = information
        var arr = swag.components(separatedBy: ",")
        locationInfo?.text = arr[0]
        locationType?.text = arr[1]
        locationAddress?.text = arr[5]
        locationCity?.text = arr[8]
        locationZip?.text = arr[2]
        locationNumber?.text = arr[3]

        // Do any additional setup after loading the view.
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
