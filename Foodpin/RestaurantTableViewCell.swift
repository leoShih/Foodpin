//
//  RestaurantTableViewCell.swift
//  Foodpin
//
//  Created by Leo on 2017/4/29.
//  Copyright © 2017年 Leo. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var thumbImageLabel: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
