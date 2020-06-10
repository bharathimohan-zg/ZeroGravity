//
//  ProgressTableViewCell.swift
//  zerogravity
//
//  Created by Bharathimohan on 30/08/19.
//  Copyright © 2019 Bharathimohan. All rights reserved.
//

import UIKit
class ProgressTableViewCell: UITableViewCell {
    var progressArray:[String] = []
    @IBOutlet weak var querisBtn: UIButton!
    @IBOutlet weak var addressTitle: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var addressLine1: UILabel!
    @IBOutlet weak var addressLine2: UILabel!
    @IBOutlet weak var zipcode: UILabel!
    @IBOutlet weak var progressBar: StepIndicatorView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupprogressBar()
    }
    var inset: UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }
    func setupprogressBar() {
        self.progressBar.statusArray = progressArray
        self.progressBar.numberOfSteps = progressArray.count
        self.progressBar.currentStep = 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
