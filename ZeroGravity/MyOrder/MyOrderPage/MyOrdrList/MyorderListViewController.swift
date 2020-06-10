//
//  MyorderListViewController.swift
//  zerogravity
//
//  Created by Bharathimohan on 23/08/19.
//  Copyright © 2019 Bharathimohan. All rights reserved.
//

import UIKit

class MyorderListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        UIApplication.shared.statusBarUIView?.backgroundColor = UIColor(red: 241/255.0, green: 107/255.0, blue: 182/255.0, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor(red: 241/255.0, green: 107/255.0, blue: 182/255.0, alpha: 1)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func orderAction(_ sender: Any) {
        selectAction()
    }
    
    func selectAction() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "All Orders", style: .default , handler:{ (UIAlertAction)in
        }))
        alert.addAction(UIAlertAction(title: "Completed Orders", style: .default , handler:{ (UIAlertAction)in
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction)in
        }))
        self.present(alert, animated: true, completion: {
        })
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myOrderIdentifier", for: indexPath) as! MyOrderListTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "summaryInfoIdentifier", sender: self)

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "summaryInfoIdentifier") {
            DispatchQueue.main.async {
            let _ : SummaryViewController = segue.destination as! SummaryViewController
            }
        }
    }


}
