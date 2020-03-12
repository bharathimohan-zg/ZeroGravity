//
//  CollapsibleTableViewHeader.swift
//  zerogravity
//
//  Created by Bharathimohan on 18/09/19.
//  Copyright © 2019 Bharathimohan. All rights reserved.
//

import UIKit

class CollapsibleTableViewHeader: UITableViewCell {
    @IBOutlet weak var headrName: UILabel!
    @IBOutlet weak var indicateBtn: UIButton!
    @IBOutlet weak var expendCollapseBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
