//
//  LoginTypeViewController.swift
//  zerogravity
//
//  Created by Bharathimohan on 12/05/20.
//  Copyright © 2020 Bharathimohan. All rights reserved.
//

import UIKit
var loginType: String = ""
class LoginTypeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func customerAction(_ sender: Any) {
        loginType = "Customer"
        self.sliderFunc()
//        DispatchQueue.main.async {
//        let main: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        guard let vcObj = main.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
//            return
//        }
//            self.navigationController?.pushViewController(vcObj, animated: true)
//        }
    }
    @IBAction func eventAction(_ sender: Any) {
        loginType = "Event"
        self.sliderFunc()
//        DispatchQueue.main.async {
//        let main: UIStoryboard = UIStoryboard(name: "LoginType", bundle: nil)
//        guard let vcObj = main.instantiateViewController(withIdentifier: "CarouselViewController") as? CarouselViewController else {
//            return
//        }
//         self.navigationController?.pushViewController(vcObj, animated: true)
//        }
    }
    
    func sliderFunc() {
        DispatchQueue.main.async {
        let main: UIStoryboard = UIStoryboard(name: "LoginType", bundle: nil)
        guard let vcObj = main.instantiateViewController(withIdentifier: "CarouselViewController") as? CarouselViewController else {
            return
        }
         self.navigationController?.pushViewController(vcObj, animated: true)
        }
    }

}
