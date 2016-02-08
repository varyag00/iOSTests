//
//  SpotterTableViewController.swift
//  SpotDan
//
//  Created by Thomas McGoey-Smith on 2016-01-27.
//  Copyright © 2016 Safewalk. All rights reserved.
//

import UIKit

class SpotterTableViewController: UITableViewController {

    var gym: Gym?
    var spotters = [Spotter]()
    
    // LoadSpotters - What we'll be focusing on
    func loadSpotters() {
        
        // Question:
        // Right now, we're just hard coding the gym's spotters. So how could we integrate our server here....
        
        let spotter1 = Spotter()
        
        spotter1.id = -1
        spotter1.name = "Jammie"
        spotter1.profileImage = "http://mypicture.com/profile.png"
        spotter1.bio = "I spot people lifting"
        spotter1.equipmentId = -1
        spotter1.gymId = -1
        
        let spotter2 = Spotter()
        
        spotter2.id = -1
        spotter2.name = "Taylor"
        spotter2.profileImage = "http://mypicture.com/profile.png"
        spotter2.bio = "I do some heavy lifting"
        spotter2.equipmentId = -1
        spotter2.gymId = -1

        spotters += [spotter1, spotter2]
        
    }
    

    
    
    // Not too concerned about this stuff below...
    
    // If you're needing a hand with implementing a TableView, check out Apple's Developer Docs:
    // https://developer.apple.com/library/ios/referencelibrary/GettingStarted/DevelopiOSAppsSwift/Lesson7.html#//apple_ref/doc/uid/TP40015214-CH8-SW1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSpotters()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spotters.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "SpotterTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SpotterTableViewCell
        
        // Configure the cell...
        cell.nameLabel.text = spotters[indexPath.row].name
        
        return cell
    }


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let spottersViewController = segue.destinationViewController as! SpotterViewController
        
        // Get the cell that generated this segue.
        if let selectedSpotterCell = sender as? SpotterTableViewCell {
            let indexPath = tableView.indexPathForCell(selectedSpotterCell)!
            let selectedSpotter = spotters[indexPath.row]
            spottersViewController.spotter = selectedSpotter
        }

    }
    
    
    @IBAction func touchRefreshButton(sender: UIButton) {
        self.spotters = []
        loadSpotters()
    }
    
}
