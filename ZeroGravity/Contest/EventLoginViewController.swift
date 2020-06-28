//
//  EventLoginViewController.swift
//  zerogravity
//
//  Created by Bharathimohan on 10/06/20.
//  Copyright © 2020 Bharathimohan. All rights reserved.
//

import UIKit

class EventLoginViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var termsLbl: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var loginImg: UIImageView!
    @IBOutlet weak var textInputView: UIView!
    @IBOutlet weak var phoneNumberTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let Powered = NSMutableAttributedString(string: "Don’t have an account? Sign Up" )
        Powered.setColorForText("Sign Up", with: LoginViewController.hexStringToUIColor(hex: hexaColor))
        termsLbl.attributedText = Powered
        self.addGestures()
        let labelTapGesture = UITapGestureRecognizer(target:self,action:#selector(self.signUpAction))
        termsLbl.isUserInteractionEnabled = true
        termsLbl.addGestureRecognizer(labelTapGesture)

        // Do any additional setup after loading the view.
    }
    @objc func signUpAction() {
           DispatchQueue.main.async {
           let main: UIStoryboard = UIStoryboard(name: "Event", bundle: nil)
           guard let vcObj = main.instantiateViewController(withIdentifier: "EventSignUpViewController") as? EventSignUpViewController else {
               return
           }
            self.navigationController?.pushViewController(vcObj, animated: true)
           }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        phoneNumberTxt.text = ""
        self.onTap()
    }
    func addGestures() {
           let tap = UITapGestureRecognizer(target: self, action: #selector(onTap))
           self.view.addGestureRecognizer(tap)
       }
       @objc func onTap() {
           phoneNumberTxt.resignFirstResponder()
       }
    @IBAction func loginAction(_ sender: Any) {
        self.onTap()
        DispatchQueue.main.async {
        let main: UIStoryboard = UIStoryboard(name: "Event", bundle: nil)
        guard let vcObj = main.instantiateViewController(withIdentifier: "EventOtpViewController") as? EventOtpViewController else {
            return
        }
         self.navigationController?.pushViewController(vcObj, animated: true)
        }
    }
    
    @IBAction func backAction(_ sender: Any) {
        DispatchQueue.main.async {
        let main: UIStoryboard = UIStoryboard(name: "LoginType", bundle: nil)
        guard let vcObj = main.instantiateViewController(withIdentifier: "LoginTypeViewController") as? LoginTypeViewController else {
            return
        }
         self.navigationController?.pushViewController(vcObj, animated: true)
        }
//        if let destinationViewController = navigationController?.viewControllers
//            .filter({$0.classForCoder == EventLoginViewController.self})
//            .first {
//            navigationController?.popToViewController(destinationViewController, animated: true)
//        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
