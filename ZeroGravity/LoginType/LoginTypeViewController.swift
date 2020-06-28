//
//  LoginTypeViewController.swift
//  zerogravity
//
//  Created by Bharathimohan on 12/05/20.
//  Copyright © 2020 Bharathimohan. All rights reserved.
//

import UIKit
var loginType: String = ""
class LoginTypeTableViewCell: UITableViewCell {
    @IBOutlet weak var loginType: UILabel!
    @IBOutlet weak var loginInfo: UILabel!
    @IBOutlet weak var elipseIcon: UIImageView!
    override func awakeFromNib() {
       super.awakeFromNib()
       // Initialization code
   }

   override func setSelected(_ selected: Bool, animated: Bool) {
       super.setSelected(selected, animated: animated)
       // Configure the view for the selected state
   }
}
class LoginTypeViewController: UIViewController {
    @IBOutlet weak var poweredbyLbl: UILabel!
    @IBOutlet weak var loginTypetable: UITableView!
    let loginTYpeDict = ["Are you Client?":"Dummy Content for Sub Title","Apply Contest":"Photography Contest SignUp"]
    let loginTYpeArray = ["Are you Client?","Apply Contest"]

    override func viewDidLoad() {
        super.viewDidLoad()
        loginType = ""
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
        let Powered = NSMutableAttributedString(string: "Powered By ZERO GRAVITY TECH" )
        Powered.setColorForText("ZERO GRAVITY TECH", with: LoginViewController.hexStringToUIColor(hex: hexaColor))
        poweredbyLbl.attributedText = Powered
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

extension LoginTypeViewController: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loginTYpeArray.count
    }
    
    func  tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = loginTypetable.dequeueReusableCell(withIdentifier: "LoginTypeIdentifier", for: indexPath) as! LoginTypeTableViewCell
        let logintype = loginTYpeArray[indexPath.row]
        cell.loginType.text = logintype
        cell.loginInfo.text = loginTYpeDict[logintype]
        cell.elipseIcon.image = UIImage(named: logintype == "Are you Client?" ? "people.png": "AddPhoto.png")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let logintype = loginTYpeArray[indexPath.row]
        if logintype == "Are you Client?" {
            loginType = "Customer"
            self.sliderFunc()
        } else if logintype == "Apply Contest" {
            loginType = "Event"
            self.sliderFunc()
        }
    }
}

extension NSMutableAttributedString{
    func setColorForText(_ textToFind: String, with color: UIColor) {
        let range = self.mutableString.range(of: textToFind, options: .caseInsensitive)
        if range.location != NSNotFound {
            addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        }
    }
}
