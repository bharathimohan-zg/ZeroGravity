//
//  BlogWebViewController.swift
//  zerogravity
//
//  Created by Bharathimohan on 28/08/19.
//  Copyright © 2019 Bharathimohan. All rights reserved.
//

import UIKit
import WebKit

class BlogWebViewController: UIViewController {
    var blogWebUrl:String = ""

    @IBOutlet weak var blogWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarUIView?.backgroundColor = LoginViewController.hexStringToUIColor(hex: hexaColor)
        let url = URL(string: blogWebUrl)
        blogWebView.load(URLRequest(url: url!))

        // Do any additional setup after loading the view.
    }

}
