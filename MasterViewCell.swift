//
//  MasterViewCell.swift
//  SampleDemo
//
//  Created by ispl Mac Mini on 8/11/17.
//  Copyright © 2017 infinium. All rights reserved.
//

import UIKit

class MasterViewCell: UITableViewCell {

    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblCity: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
