//
//  TableViewCell.swift
//  WeatherAPI
//
//  Created by Boss on 6/26/19.
//  Copyright © 2019 Boss. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    
    //day
    @IBOutlet weak var date_epochLabel: UILabel!
    //toc do gio
    @IBOutlet weak var maxwind_kphLabel: UILabel!
    
    // do am
    @IBOutlet weak var avgtemp_fLabel: UILabel!
    //nhiet do
    @IBOutlet weak var temp_cLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
