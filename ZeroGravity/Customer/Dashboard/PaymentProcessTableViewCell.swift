//
//  PaymentProcessTableViewCell.swift
//  zerogravity
//
//  Created by Bharathimohan on 30/08/19.
//  Copyright © 2019 Bharathimohan. All rights reserved.
//

import UIKit
import CircleProgressBar

class PaymentProcessTableViewCell: UITableViewCell {

    @IBOutlet weak var circleProgressBar: CircleProgressBar!
    override func awakeFromNib() {
        super.awakeFromNib()
        circleProgressBar.hintTextFont =  UIFont(name: FONT.Ubuntu.rawValue, size: 25)
        circleProgressBar.setProgress(0.5, animated: true, duration: 0.3)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
