//
//  EventOtpViewController.swift
//  zerogravity
//
//  Created by Bharathimohan on 08/05/20.
//  Copyright © 2020 Bharathimohan. All rights reserved.
//

import UIKit

class EventOtpViewController: UIViewController {
    @IBOutlet weak var otpTextField: SGCodeTextField!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var joinBtn: UIButton!
    @IBOutlet weak var resend: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let Powered = NSMutableAttributedString(string: "Resend Verification Code? 0.30" )
        Powered.setColorForText("0.30", with: LoginViewController.hexStringToUIColor(hex: hexaColor))
        resend.attributedText = Powered
        self.addGestures()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           otpTextField.text = ""
           self.onTap()
       }
    func addGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap))
        self.view.addGestureRecognizer(tap)
    }
    @objc func onTap() {
        otpTextField.resignFirstResponder()
    }
    @IBAction func editAction(_ sender: Any) {
        if let destinationViewController = navigationController?.viewControllers
            .filter({$0.classForCoder == EventLoginViewController.self})
            .first {
            navigationController?.popToViewController(destinationViewController, animated: true)
        }
    }
    @IBAction func joinAction(_ sender: Any) {
        self.onTap()
//        DispatchQueue.main.async {
//            let next = self.storyboard?.instantiateViewController(withIdentifier: "AnimateTabbarViewController") as! AnimateTabbarViewController
//            self.present(next, animated: true, completion: nil)
//        }
        DispatchQueue.main.async {
        let main: UIStoryboard = UIStoryboard(name: "Event", bundle: nil)
        guard let vcObj = main.instantiateViewController(withIdentifier: "AnimateTabbarViewController") as? AnimateTabbarViewController else {
            return
        }
         self.navigationController?.pushViewController(vcObj, animated: true)
        }

    }
    @IBAction func backAction(_ sender: Any) {
        if let destinationViewController = navigationController?.viewControllers
            .filter({$0.classForCoder == EventLoginViewController.self})
            .first {
            navigationController?.popToViewController(destinationViewController, animated: true)
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
