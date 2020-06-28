//
//  EventSignUpViewController.swift
//  zerogravity
//
//  Created by Bharathimohan on 11/06/20.
//  Copyright © 2020 Bharathimohan. All rights reserved.
//

import UIKit

class EventSignUpViewController: UIViewController {
    @IBOutlet weak var signInLbl: UILabel!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var mobileNumberText: UITextField!
    @IBOutlet weak var categoryBtn: UIButton!
    @IBOutlet weak var signupBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let Powered = NSMutableAttributedString(string: "Aleady have an account ? Sign In" )
        Powered.setColorForText("Sign In", with: LoginViewController.hexStringToUIColor(hex: hexaColor))
        signInLbl.attributedText = Powered
        self.addGestures()
        let labelTapGesture = UITapGestureRecognizer(target:self,action:#selector(self.signInAction))
        signInLbl.isUserInteractionEnabled = true
        signInLbl.addGestureRecognizer(labelTapGesture)

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        nameText.text = ""
        mobileNumberText.text = ""
        self.onTap()
        }
    
    @objc func signInAction() {
           DispatchQueue.main.async {
           let main: UIStoryboard = UIStoryboard(name: "Event", bundle: nil)
           guard let vcObj = main.instantiateViewController(withIdentifier: "EventLoginViewController") as? EventLoginViewController else {
               return
           }
            self.navigationController?.pushViewController(vcObj, animated: true)
           }
    }
    
    func addGestures() {
           let tap = UITapGestureRecognizer(target: self, action: #selector(onTap))
           self.view.addGestureRecognizer(tap)
       }
       @objc func onTap() {
        nameText.resignFirstResponder()
         mobileNumberText.resignFirstResponder()
       }
    @IBAction func backAction(_ sender: Any) {
        if let destinationViewController = navigationController?.viewControllers
            .filter({$0.classForCoder == EventLoginViewController.self})
            .first {
            navigationController?.popToViewController(destinationViewController, animated: true)
        }
    }
    
    @IBAction func categoryAction(_ sender: Any) {
    }
    @IBAction func signUpAction(_ sender: Any) {
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
