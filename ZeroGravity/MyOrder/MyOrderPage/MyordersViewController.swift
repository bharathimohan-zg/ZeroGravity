//
//  MyordersViewController.swift
//  zerogravity
//
//  Created by Bharathimohan on 13/08/19.
//  Copyright © 2019 Bharathimohan. All rights reserved.
//

import UIKit

class MyordersViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var myorderTableView: UITableView!
    let orderList = ["PAYMENT TERMS","QUOTATION","SERVICES","CONFIRM EVENT FLOW","SHOOT SCHEDULE","NEED HELP?"]

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarUIView?.backgroundColor = UIColor(red: 241/255.0, green: 107/255.0, blue: 182/255.0, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor(red: 241/255.0, green: 107/255.0, blue: 182/255.0, alpha: 1)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderList.count > 0 ? orderList.count : 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderIdentifier", for: indexPath) as! orderTableViewCell
        cell.orderName.text = orderList[indexPath .row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         if orderList[indexPath .row] == "CONFIRM EVENT FLOW"
        {
            self.performSegue(withIdentifier: "ShootSegue", sender: self)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ShootSegue") {
            DispatchQueue.main.async {
                let _ : EventFlowViewController = segue.destination as! EventFlowViewController
            }
        }
    }
}
