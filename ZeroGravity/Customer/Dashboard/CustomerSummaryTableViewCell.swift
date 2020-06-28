//
//  CustomerSummaryTableViewCell.swift
//  zerogravity
//
//  Created by Bharathimohan on 30/08/19.
//  Copyright © 2019 Bharathimohan. All rights reserved.
//

import UIKit

class CustomerSummaryTableViewCell: UITableViewCell {
    @IBOutlet weak var customerName: UILabel!
    @IBOutlet weak var quotationNo: UILabel!
    
    @IBOutlet weak var totalPackage: UILabel!
    @IBOutlet weak var adfvancePaid: UILabel!
    @IBOutlet weak var remainingDue: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        layoutMargins = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
