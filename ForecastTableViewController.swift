//
//  ForecastTableViewController.swift
//  NOAA Forecast
//
//  Created by Kaelin Osmun on 3/22/16.
//  Copyright © 2016 Kaelin Osmun. All rights reserved.
//

import UIKit

class ForecastTableViewController: UITableViewController {

//    @IBOutlet weak var weatherIconImage: UIImageView!
//    
//    @IBOutlet weak var dayOfTheWeekLabel: UILabel!
//    
//    @IBOutlet weak var weatherTitleLabel: UILabel!
//    
//    @IBOutlet weak var temperatureLabel: UILabel!
//    
//    @IBOutlet weak var windChillLabel: UILabel!
    
    var cellTapped:Bool = true
    var currentRow = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = NSURL(string: "http://www.ncdc.noaa.gov/cdo-web/api/v2/datacategories?limit=41") {
            
            let weatherRequest = NSMutableURLRequest(URL: url)
            weatherRequest.addValue("LkpkGBbYYJBTBdhsDWYQpKnIdsPjaZed", forHTTPHeaderField: "token")
            print(weatherRequest)
            
        }
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var selectedRowIndex = indexPath
        currentRow = selectedRowIndex.row
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == currentRow {
            if cellTapped == false {
                cellTapped = true
                return 141
            } else {
                cellTapped = false
                return 70
            }
        }
        return 70
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}