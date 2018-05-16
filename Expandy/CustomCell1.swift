//
//  CustomCell1.swift
//  Expandy
//
//  Created by aptrise on 16/05/18.
//  Copyright © 2018 aptrise. All rights reserved.
//

import UIKit

class CustomCell1: UITableViewCell {

    
    @IBOutlet var label: UILabel!
    
    
    @IBOutlet var imageVie: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
