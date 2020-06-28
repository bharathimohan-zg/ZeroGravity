//
//  ForgotpasswordViewController.swift
//  zerogravity
//
//  Created by Bharathimohan on 12/08/19.
//  Copyright © 2019 Bharathimohan. All rights reserved.
//

import UIKit

class ForgotpasswordViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var passwordTxtFld: UITextField!
    @IBOutlet weak var conformPasswordTxtFld: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = LoginViewController.hexStringToUIColor(hex: hexaColor)
        passwordTxtFld.setBottomBorder()
        conformPasswordTxtFld.setBottomBorder()

        // Do any additional setup after loading the view.
    }

    @IBAction func changePasswordAction(_ sender: Any) {
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
