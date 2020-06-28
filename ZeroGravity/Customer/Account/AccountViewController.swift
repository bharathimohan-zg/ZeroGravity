//
//  AccountViewController.swift
//  zerogravity
//
//  Created by Bharathimohan on 12/08/19.
//  Copyright © 2019 Bharathimohan. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var accountTable: UITableView!
    let accountList = ["Orders","Request","Manage Address","Support","Logout"]
    override func viewDidLoad() {
        super.viewDidLoad()
        userIcon.layer.borderWidth = 1
        userIcon.layer.masksToBounds = false
        userIcon.layer.borderColor = UIColor.white.cgColor
        userIcon.layer.cornerRadius = userIcon.frame.height/2
        userIcon.clipsToBounds = true
        self.navigationController?.isNavigationBarHidden = true
        UIApplication.shared.statusBarUIView?.backgroundColor = LoginViewController.hexStringToUIColor(hex: hexaColor)
        navigationController?.navigationBar.barTintColor = LoginViewController.hexStringToUIColor(hex: hexaColor)
        if let templateImage = UIImage(named: "userIcon")?.withRenderingMode(.alwaysTemplate) {            let imageView = UIImageView(image: templateImage)
            userIcon.image = imageView.image
            userIcon.tintColor = .white
        }

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountList.count > 0 ? accountList.count : 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountIdentifier", for: indexPath) as! AccountTableViewCell
        cell.accountName.text = accountList[indexPath .row]
        
        if let templateImage = UIImage(named: "userIcon")?.withRenderingMode(.alwaysTemplate) {            let imageView = UIImageView(image: templateImage)
            cell.accountTypeimg.image = imageView.image
            cell.accountTypeimg.tintColor = LoginViewController.hexStringToUIColor(hex: hexaColor)
        }
        cell.accessoryType = .disclosureIndicator
        cell.tintColor = LoginViewController.hexStringToUIColor(hex: hexaColor)
        if let image = UIImage(named:"Arrow")?.withRenderingMode(.alwaysTemplate)
        {
            let checkmark  = UIImageView(frame:CGRect(x:0, y:0, width:(image.size.width), height:(image.size.height)));
        checkmark.image = image
        cell.accessoryView = checkmark
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         if accountList[indexPath .row] == "Logout"
         {
             DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
            }
        }
        else if accountList[indexPath .row] == "Orders"
        {
            self.performSegue(withIdentifier: "myOrderListtSegue", sender: self)
        }
         else if accountList[indexPath .row] == "Support"
         {
            self.performSegue(withIdentifier: "HelpSegue", sender: self)
        }
         else if accountList[indexPath .row] == "Manage Address"
         {
            self.performSegue(withIdentifier: "ManageAddressSegue", sender: self)
        }


    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "myOrderListtSegue") {
            DispatchQueue.main.async {
            let _ : MyorderListViewController = segue.destination as! MyorderListViewController
            }
        }
       else if (segue.identifier == "HelpSegue") {
            DispatchQueue.main.async {
                let _ : HelpSupportViewController = segue.destination as! HelpSupportViewController
            }
        }else if (segue.identifier == "ManageAddressSegue") {
            DispatchQueue.main.async {
                let _ : ManageAddressViewController = segue.destination as! ManageAddressViewController
            }
        }
    }

} 

extension UIApplication {
var statusBarUIView: UIView? {
    if #available(iOS 13.0, *) {
        let tag = 3848245

        let keyWindow = UIApplication.shared.connectedScenes
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows.first

        if let statusBar = keyWindow?.viewWithTag(tag) {
            return statusBar
        } else {
            let height = keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? .zero
            let statusBarView = UIView(frame: height)
            statusBarView.tag = tag
            statusBarView.layer.zPosition = 999999

            keyWindow?.addSubview(statusBarView)
            return statusBarView
        }

    } else {

        if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        }
    }
    return nil
  }
}
