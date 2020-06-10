//
//  QuotationHeaderTableViewCell.swift
//  zerogravity
//
//  Created by Bharathimohan on 13/05/20.
//  Copyright © 2020 Bharathimohan. All rights reserved.
//

import UIKit

class QuotationHeaderTableViewCell: UITableViewCell {
    @IBOutlet weak var headrName: UILabel!
    @IBOutlet weak var indicateBtn: UIButton!
    @IBOutlet weak var expendCollapseBtn: UIButton!
    @IBOutlet weak var statusImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
