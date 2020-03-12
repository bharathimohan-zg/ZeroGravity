//
//  EventFlowViewController.swift
//  zerogravity
//
//  Created by Bharathimohan on 27/09/19.
//  Copyright © 2019 Bharathimohan. All rights reserved.
//

import UIKit

class EventFlowViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    let EventList = ["WEDDING","RECEPTION","ENGAGEMENT"]

    @IBOutlet weak var eventFlowTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EventList.count > 0 ? EventList.count : 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventIdentifier", for: indexPath) as! EventTableViewCell
        cell.eventName.text = EventList[indexPath .row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

}
