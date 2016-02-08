//
//  EquipmentViewController.swift
//  SpotDan
//
//  Created by Thomas McGoey-Smith on 2016-01-27.
//  Copyright © 2016 Safewalk. All rights reserved.
//

import UIKit

class EquipmentViewController: UIViewController {

    var equipment: Equipment?
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var gymIdLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(self.equipment!.name)
        print(self.equipment!.description)

        setupViewUsingLoadedEquipment()
    }
    
    func setupViewUsingLoadedEquipment() {
        self.title = self.equipment?.name
        self.idLabel.text = String(self.equipment!.id!)
        self.nameLabel.text = self.equipment?.name
        self.descriptionLabel.text = self.equipment?.description
        self.locationLabel.text = self.equipment?.location
        self.gymIdLabel.text = String(self.equipment!.gym_id!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
