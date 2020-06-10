//
//  ViewController.swift
//  zerogravity
//
//  Created by Bharathimohan on 12/08/19.
//  Copyright © 2019 Bharathimohan. All rights reserved.
//

import UIKit
var hexaColor = "#F16BB6"
class LoginViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var userTxtFld: UITextField!
    @IBOutlet weak var pwdLoginTxtFld: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.hidesBackButton = true
        UIApplication.shared.statusBarUIView?.backgroundColor = UIColor(red: 241/255.0, green: 107/255.0, blue: 182/255.0, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor(red: 241/255.0, green: 107/255.0, blue: 182/255.0, alpha: 1)
        userTxtFld.setBottomBorder()
        pwdLoginTxtFld.setBottomBorder()
        if let templateImage = UIImage(named: "userIcon")?.withRenderingMode(.alwaysTemplate) {            let imageView = UIImageView(image: templateImage)
            imageView.tintColor = LoginViewController.hexStringToUIColor(hex: hexaColor)
            userTxtFld.rightViewMode = .always
            userTxtFld.rightView = imageView
        }
        if let templateImage = UIImage(named: "Password")?.withRenderingMode(.alwaysTemplate) {            let imageView = UIImageView(image: templateImage)
            imageView.tintColor = LoginViewController.hexStringToUIColor(hex: hexaColor)
            pwdLoginTxtFld.rightViewMode = .always
            pwdLoginTxtFld.rightView = imageView
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBAction func signInAction(_ sender: Any) {
//        self.performSegue(withIdentifier: "DashboardSegue", sender: nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if (segue.identifier == "DashboardSegue") {
//            DispatchQueue.main.async {
//                let next = self.storyboard?.instantiateViewController(withIdentifier: "CustomerDashBoardViewController") as! CustomerDashBoardViewController
//                self.present(next, animated: true, completion: nil)
//            }
//        }
//    }

    class func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}


extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
// MARK: FONT

enum FONT: String {
    case Ubuntu = "Ubuntu-Light"
}
