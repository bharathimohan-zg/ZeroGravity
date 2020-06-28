//
//  HelpSupportViewController.swift
//  zerogravity
//
//  Created by Bharathimohan on 24/09/19.
//  Copyright © 2019 Bharathimohan. All rights reserved.
//

import UIKit

class HelpSupportViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        UIApplication.shared.statusBarUIView?.backgroundColor = LoginViewController.hexStringToUIColor(hex: hexaColor)
        navigationController?.navigationBar.barTintColor = LoginViewController.hexStringToUIColor(hex: hexaColor)
    }
    func dialNumber(number : String) {
        
        if let url = URL(string: "tel://\(number)"),
            UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler:nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        } else {
            
        }
    }

    @IBAction func clickToCall(_ sender: Any) {
        dialNumber(number: "7788995566")
    }
}
