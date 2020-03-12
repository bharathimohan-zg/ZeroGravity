//
//  PaymentProcessTableViewCell.swift
//  zerogravity
//
//  Created by Bharathimohan on 30/08/19.
//  Copyright © 2019 Bharathimohan. All rights reserved.
//

import UIKit
import UICircularProgressRing

class PaymentProcessTableViewCell: UITableViewCell {
    @IBOutlet weak var circuleProgressView: UICircularProgressRing!

    override func awakeFromNib() {
        super.awakeFromNib()
        circuleProgressView.maxValue = 100
        circuleProgressView.startProgress(to: 50, duration: 1.0) {
        }

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
