//
//  MyOrderSummaryViewController.swift
//  zerogravity
//
//  Created by Bharathimohan on 23/08/19.
//  Copyright © 2019 Bharathimohan. All rights reserved.
//

import UIKit




class MyOrderSummaryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var summaryTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false

        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerInfoIdentifier", for: indexPath) as! CustomerInfoTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderInfoIdentifier", for: indexPath) as! OrderInfoTableViewCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailIdentifier", for: indexPath) as! OrderDetailsTableViewCell
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InvoicerIdentifier", for: indexPath) as! InvoiceTableViewCell
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddressIdentifier", for: indexPath) as! AddressTableViewCell
            return cell

        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 84
        case 1:
            return 104
        case 2:
            return (CGFloat((summaryInfoArray.count * 74) + 70))
        case 3:
            return 44
        case 4:
            return 115
        default:
            return 0
        }
        
    }

}


