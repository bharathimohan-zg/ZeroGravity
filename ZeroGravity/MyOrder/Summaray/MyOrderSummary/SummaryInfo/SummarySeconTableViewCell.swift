//
//  SummarySeconTableViewCell.swift
//  zerogravity
//
//  Created by Bharathimohan on 23/08/19.
//  Copyright © 2019 Bharathimohan. All rights reserved.
//

import UIKit

class SummarySeconTableViewCell: UITableViewCell {

    @IBOutlet weak var summaryStatusImg: UIImageView!
    
    @IBOutlet weak var statusView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
