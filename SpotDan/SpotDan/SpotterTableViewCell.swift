//
//  SpotterTableViewCell.swift
//  SpotDan
//
//  Created by Thomas McGoey-Smith on 2016-01-27.
//  Copyright © 2016 Safewalk. All rights reserved.
//

import UIKit

class SpotterTableViewCell: UITableViewCell {

    // MARK : Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
