//
//  GymTableViewController.swift
//  SpotDan
//
//  Created by Thomas McGoey-Smith on 2016-01-26.
//  Copyright © 2016 Safewalk. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class GymTableViewController: UITableViewController {

    var gyms = [Gym]()
    
    // LoadGyms - What we'll be focusing on
    func loadGyms() {
        
        Alamofire.request(.GET, "http://api.spotdan.com/v1/gyms.json")
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let jsonData = response.result.value {
                    //print("JSON: \(JSON)")
                    let gymsJSON = JSON(jsonData)
                    
                    for(_, g)   in gymsJSON{
                        let gym = Gym()
                        gym.id = g["id"].int64
                        gym.name = g["name"].string
                        gym.phoneNumber = g["phone_number"].string
                        gym.addressLine = g["addressLine"].string
                        gym.city = g["city"].string
                        gym.province = g["province"].string
                        gym.postalCode = g["postal_code"].string
                        gym.country = g["contry"].string
                        gym.longitude = g["longitude"].string
                        gym.latitude = g["latitude"].string
                     
                        self.gyms += [gym]
                    }
                    
                    self.tableView.reloadData()
                }
        }
        
        
        
        
        
//        // Question:
//        // Right now, we're just hard coding the gyms. So how could we integrate our server here....
//        
//        let gym1 = Gym()
//        
//        gym1.id = -1
//        gym1.name = "Fit4Less"
//        gym1.city = "Calgary"
//        gym1.phoneNumber = "+12303303"
//        gym1.addressLine = "123 Fake Street"
//        gym1.city = "Calgary"
//        gym1.province = "Alberta"
//        gym1.country = "Canada"
//        gym1.longitude = "112.121"
//        gym1.latitude = "34.122"
//        
//        let gym2 = Gym()
//        
//        gym2.id = -1
//        gym2.name = "Planet Fitness"
//        gym2.city = "Calgary"
//        gym2.phoneNumber = "+12303303"
//        gym2.addressLine = "123 Fake Street"
//        gym2.city = "Calgary"
//        gym2.province = "Alberta"
//        gym2.country = "Canada"
//        gym2.longitude = "112.121"
//        gym2.latitude = "34.122"
//        
//        gyms += [gym1, gym2]
    }

    
    
    // Not too concerned about this stuff below...
    
    // If you're needing a hand with implementing a TableView, check out Apple's Developer Docs:
    // https://developer.apple.com/library/ios/referencelibrary/GettingStarted/DevelopiOSAppsSwift/Lesson7.html#//apple_ref/doc/uid/TP40015214-CH8-SW1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadGyms()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gyms.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "GymTableViewCell"

        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! GymTableViewCell

        // Configure the cell...
        cell.nameLabel.text = gyms[indexPath.row].name

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let gymsViewController = segue.destinationViewController as! GymViewController
        
        // Get the cell that generated this segue.
        if let selectedGymCell = sender as? GymTableViewCell {
            let indexPath = tableView.indexPathForCell(selectedGymCell)!
            let selectedGym = gyms[indexPath.row]
            gymsViewController.gym = selectedGym
        }
    }
    
    @IBAction func touchRefreshButton(sender: UIBarButtonItem) {
        self.gyms = []
        loadGyms()
    }
    

}
