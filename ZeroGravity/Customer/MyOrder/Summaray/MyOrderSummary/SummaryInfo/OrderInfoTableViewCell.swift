//
//  OrderInfoTableViewCell.swift
//  zerogravity
//
//  Created by Bharathimohan on 26/08/19.
//  Copyright © 2019 Bharathimohan. All rights reserved.
//

import UIKit

class OrderInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var statusImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if let templateImage = UIImage(named: "Status")?.withRenderingMode(.alwaysTemplate) {
            let imageView = UIImageView(image: templateImage)
            statusImg.image = imageView.image
            statusImg.tintColor = LoginViewController.hexStringToUIColor(hex: hexaColor)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
