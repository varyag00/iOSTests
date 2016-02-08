//
//  SpotterViewController.swift
//  SpotDan
//
//  Created by Thomas McGoey-Smith on 2016-01-27.
//  Copyright © 2016 Safewalk. All rights reserved.
//

import UIKit

class SpotterViewController: UIViewController {

    var spotter: Spotter?
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var equipmentIdLabel: UILabel!
    @IBOutlet weak var gymIdLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewUsingLoadedSpotter()
    }
    
    func setupViewUsingLoadedSpotter() {
        self.title = self.spotter?.name
        
        self.idLabel.text = String(self.spotter!.id!)
        self.nameLabel.text = self.spotter?.name
        self.profileLabel.text = self.spotter?.profileImage
        self.bioLabel.text = self.spotter?.bio
        self.equipmentIdLabel.text = String(self.spotter!.equipmentId!)
        self.gymIdLabel.text = String(self.spotter!.gymId!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
