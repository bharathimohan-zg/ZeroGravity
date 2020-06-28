//
//  ProfileViewController.swift
//  zerogravity
//
//  Created by Bharathimohan on 17/06/20.
//  Copyright © 2020 Bharathimohan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backAction(_ sender: Any) {
        DispatchQueue.main.async {
         let main: UIStoryboard = UIStoryboard(name: "LoginType", bundle: nil)
         guard let vcObj = main.instantiateViewController(withIdentifier: "LoginTypeViewController") as? LoginTypeViewController else {
             return
         }
          self.navigationController?.pushViewController(vcObj, animated: true)
         }
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
