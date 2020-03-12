//
//  AccountTableViewCell.swift
//  zerogravity
//
//  Created by Bharathimohan on 12/08/19.
//  Copyright © 2019 Bharathimohan. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {

    @IBOutlet weak var accountTypeimg: UIImageView!
    @IBOutlet weak var accountName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
