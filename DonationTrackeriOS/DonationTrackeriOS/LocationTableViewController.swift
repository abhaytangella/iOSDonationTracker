//
//  LocationTableViewController.swift
//  DonationTrackeriOS
//
//  Created by Abhay Tangella on 12/3/18.
//  Copyright © 2018 Abhay Tangella. All rights reserved.
//

import UIKit

class LocationTableViewController: UITableViewController {
    
    var locationData : String = ""
    var trueswag : NSArray = []
    var selectedIndex : Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "location", for: indexPath)
    
        let url = URL(string: "http://35.231.154.102/?table=locations")
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                print("Data is empty")
                return
            }
            let sentence = String(data: data, encoding: .utf8)!
            var lines: [String] = []
            sentence.enumerateLines { line, _ in
                lines.append(line)
            }
            self.trueswag = lines as NSArray
            var arr = lines[indexPath.row].components(separatedBy: ",")
            DispatchQueue.main.async {
                cell.textLabel!.text = arr[0]
            }
        }
        
        task.resume()

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        locationData = (cell!.textLabel?.text)!
        NSLog("Im here %i",indexPath.row)
        self.selectedIndex = indexPath.row
        self.performSegue(withIdentifier: "tableToInfo", sender: self)
        //print(cell!.textLabel?.text)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is LocationInfoViewController {
            
            /*let selectedIndex = sender as! NSIndexPath
            let cell = tableView.cellForRow(at: selectedIndex as IndexPath)
            self.sendSelectedData = (cell.label?.text)! as String as NSString
            
            print(self.sendSelectedData) // till here it worked for me - it is filled with my label.text
            // I don't know what this is "viewController.labelcell", so you have to to know how to go on from here on
            
            viewController.labelcell = ([self.sendSelectedData as String])*/
            let vc = segue.destination as? LocationInfoViewController
            vc?.information = locationData
            NSLog("Hi %i", selectedIndex)
            vc?.swag = trueswag[selectedIndex] as! String
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
