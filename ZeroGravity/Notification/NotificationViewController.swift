//
//  NotificationViewController.swift
//  zerogravity
//
//  Created by Bharathimohan on 22/08/19.
//  Copyright © 2019 Bharathimohan. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    let orderList = ["PAYMENT TERMS","QUOTATION","SERVICES","CONFIRM EVENT FLOW","SHOOT SCHEDULE","SHOOT REVIEW","DELIVERY TRACKERS","REMINDERS","NEED HELP?"]

    @IBOutlet weak var notificationSegment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
           notificationSegment.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
           notificationSegment.selectedSegmentTintColor = UIColor(red: 241/255.0, green: 107/255.0, blue: 182/255.0, alpha: 1)
        } else {
           notificationSegment.tintColor = UIColor(red: 241/255.0, green: 107/255.0, blue: 182/255.0, alpha: 1)
        }
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderList.count > 0 ? orderList.count : 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationIdentifier", for: indexPath) as! NotificationTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
