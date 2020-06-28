//
//  HomeTableViewCell.swift
//  zerogravity
//
//  Created by Bharathimohan on 14/08/19.
//  Copyright © 2019 Bharathimohan. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var homeTbIcon: UIImageView!
    @IBOutlet weak var offerName: UILabel!
    @IBOutlet weak var offeraType: UILabel!
    @IBOutlet weak var arrowImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
