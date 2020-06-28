//
//  EventHomeViewController.swift
//  zerogravity
//
//  Created by Bharathimohan on 11/06/20.
//  Copyright © 2020 Bharathimohan. All rights reserved.
//

import UIKit
class ContestHomeTableViewCell: UITableViewCell {
    @IBOutlet weak var contestImg: UIImageView!
    @IBOutlet weak var contestbaseView: UIView!
    @IBOutlet weak var contestName: UILabel!
    @IBOutlet weak var exploreBtn: UIButton!
    @IBOutlet weak var joinCount: UILabel!
    @IBOutlet weak var contestUserIcon: UIImageView!
    
    override func awakeFromNib() {
       super.awakeFromNib()
       // Initialization code
   }

   override func setSelected(_ selected: Bool, animated: Bool) {
       super.setSelected(selected, animated: animated)
       // Configure the view for the selected state
   }
}
class EventHomeViewController: UIViewController {
    @IBOutlet weak var topView: TopCornerView!
    @IBOutlet weak var contestContainerView: UIView!
    @IBOutlet weak var contestName: UILabel!
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var contestTbl: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = UIColor.red
    }
}

extension EventHomeViewController : UITableViewDataSource,UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContestHomeIdentifier", for: indexPath) as! ContestHomeTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}
