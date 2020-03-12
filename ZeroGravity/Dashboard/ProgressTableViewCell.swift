//
//  ProgressTableViewCell.swift
//  zerogravity
//
//  Created by Bharathimohan on 30/08/19.
//  Copyright © 2019 Bharathimohan. All rights reserved.
//

import UIKit
import FlexibleSteppedProgressBar
class ProgressTableViewCell: UITableViewCell {
    @IBOutlet weak var progressBar: SteppedProgressBar!
    var progressArray:[String] = []
    @IBOutlet weak var querisBtn: UIButton!
    @IBOutlet weak var addressTitle: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var addressLine1: UILabel!
    @IBOutlet weak var addressLine2: UILabel!
    @IBOutlet weak var zipcode: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupprogressBar()
    }
    var inset: UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }
    func setupprogressBar() {
        progressBar.insets = inset
        progressBar.stepDrawingMode = .fill
        progressBar.titles = progressArray
        progressBar.currentTab = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
