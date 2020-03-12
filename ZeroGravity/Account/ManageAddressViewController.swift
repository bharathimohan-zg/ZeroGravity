//
//  ManageAddressViewController.swift
//  zerogravity
//
//  Created by Bharathimohan on 25/09/19.
//  Copyright © 2019 Bharathimohan. All rights reserved.
//

import UIKit

class ManageAddressViewController: UIViewController,UITextViewDelegate {

    @IBOutlet weak var addressTextView: UITextView!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var editBtn: UIButton!
    var isselectEdit:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false

        addressTextView.isUserInteractionEnabled = false
        cancelBtn.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func editAction(_ sender: Any) {
        if isselectEdit == false
        {
            addressTextView.isUserInteractionEnabled = true
            editBtn.setTitle("Save", for: .normal)
            cancelBtn.isHidden = false
            isselectEdit = true
        }
        else
        {
            addressTextView.isUserInteractionEnabled = false
            cancelBtn.isHidden = true
            editBtn.setTitle("Edit", for: .normal)
            isselectEdit = false
        }
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        addressTextView.isUserInteractionEnabled = false
        cancelBtn.isHidden = true
        editBtn.setTitle("Edit", for: .normal)
        isselectEdit = false
    }
}
