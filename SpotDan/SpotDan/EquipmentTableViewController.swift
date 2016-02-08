//
//  EquipmentTableViewController.swift
//  SpotDan
//
//  Created by Thomas McGoey-Smith on 2016-01-27.
//  Copyright © 2016 Safewalk. All rights reserved.
//

import UIKit

class EquipmentTableViewController: UITableViewController {
    
    var gym: Gym?
    var equipment = [Equipment]()
    
    // LoadEquipment - What we'll be focusing on
    func loadEquipment() {
        
        // Question:
        // Right now, we're just hard coding the gym's equipment. So how could we integrate our server here....
        
        let equipment1 = Equipment()
        
        equipment1.id = -1
        equipment1.name = "Bench Press"
        equipment1.description = "Lift something heavy"
        equipment1.location = "Back of the left Gym"
        equipment1.gym_id = -1
        
        let equipment2 = Equipment()
        
        equipment2.id = -1
        equipment2.name = "Squat Rack"
        equipment2.description = "Lift something super heavy"
        equipment2.location = "Back of the right Gym"
        equipment2.gym_id = -1        
        
        equipment += [equipment1, equipment2]
    }
    
    
    // Not too concerned about this stuff below...
    
    // If you're needing a hand with implementing a TableView, check out Apple's Developer Docs:
    // https://developer.apple.com/library/ios/referencelibrary/GettingStarted/DevelopiOSAppsSwift/Lesson7.html#//apple_ref/doc/uid/TP40015214-CH8-SW1
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadEquipment()
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
        return equipment.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "EquipmentTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! EquipmentTableViewCell
        
        // Configure the cell...
        cell.nameLabel.text = equipment[indexPath.row].name
        
        return cell

    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let equipmentViewController = segue.destinationViewController as! EquipmentViewController
        
        // Get the cell that generated this segue.
        if let selectedEquipmentCell = sender as? EquipmentTableViewCell {
            let indexPath = tableView.indexPathForCell(selectedEquipmentCell)!
            let selectedEquipment = equipment[indexPath.row]
            equipmentViewController.equipment = selectedEquipment
        }
        
    }

    
    
    @IBAction func touchRefreshButton(sender: UIBarButtonItem) {
        self.equipment = []
        loadEquipment()
    }
    

}
