//
//  GymViewController.swift
//  SpotDan
//
//  Created by Thomas McGoey-Smith on 2016-01-26.
//  Copyright © 2016 Safewalk. All rights reserved.
//

import UIKit

class GymViewController: UIViewController {

    var gym: Gym?
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var addressLineLabel: UILabel!
    @IBOutlet weak var provinceLabel: UILabel!
    @IBOutlet weak var postalCodeLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    
    @IBOutlet weak var equipmentButton: UIButton!
    @IBOutlet weak var spottersButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewUsingLoadedGym()
    }
    
    func setupViewUsingLoadedGym() {
        self.title = self.gym!.name
      
        self.idLabel.text = String(self.gym!.id!)
        self.nameLabel.text = self.gym!.name
        self.cityLabel.text = self.gym!.city
        self.addressLineLabel.text = self.gym!.addressLine
        self.provinceLabel.text = self.gym!.province
        self.countryLabel.text = self.gym!.country
        self.longitudeLabel.text = self.gym!.longitude
        self.latitudeLabel.text = self.gym!.latitude
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let btn = sender as? UIButton

        
        if btn == equipmentButton {
            let equipmentTableViewController = segue.destinationViewController as! EquipmentTableViewController
            equipmentTableViewController.gym = self.gym
            
        } else if btn == spottersButton {
            let equipmentTableViewController = segue.destinationViewController as! SpotterTableViewController
            equipmentTableViewController.gym = self.gym
        }
    }
    

}
