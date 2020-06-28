//
//  SummaryViewController.swift
//  zerogravity
//
//  Created by Bharathimohan on 26/08/19.
//  Copyright © 2019 Bharathimohan. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {

    @IBOutlet weak var summarySegmaent: UISegmentedControl!
    @IBOutlet weak var summaryContainerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarUIView?.backgroundColor = LoginViewController.hexStringToUIColor(hex: hexaColor)
        navigationController?.navigationBar.barTintColor = LoginViewController.hexStringToUIColor(hex: hexaColor)

        setupView()
    }
   private func setupView() {
        setupSegmentedControl()
    }
  private  func setupSegmentedControl() {
        summarySegmaent.removeAllSegments()
        summarySegmaent.insertSegment(withTitle: "Summary", at: 0, animated: false)
        summarySegmaent.insertSegment(withTitle: "Services", at: 1, animated: false)
        summarySegmaent.selectedSegmentIndex = 0
    if #available(iOS 13.0, *) {
       summarySegmaent.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
       summarySegmaent.selectedSegmentTintColor = LoginViewController.hexStringToUIColor(hex: hexaColor)
    } else {
       summarySegmaent.tintColor = LoginViewController.hexStringToUIColor(hex: hexaColor)
    }
        summarySegmaent.addTarget(self, action: #selector(selectionDidChange(_:)), for: .valueChanged)
        updateView()
    }
    
    @objc func selectionDidChange(_ sender: UISegmentedControl) {
        updateView()
    }
    
    private lazy var summaryViewController: MyOrderSummaryViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "MyOrderSummaryViewController") as! MyOrderSummaryViewController
        self.add(asChildViewController: viewController)
        return viewController
    }()
    
    private lazy var sessionSViewController: MyOrderSummaryViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "MyOrderSummaryViewController") as! MyOrderSummaryViewController
        self.add(asChildViewController: viewController)

        return viewController
    }()

    private func updateView() {
        if summarySegmaent.selectedSegmentIndex == 0 {
            add(asChildViewController: summaryViewController)
        } else {
            add(asChildViewController: sessionSViewController)
        }
    }
    fileprivate func add(asChildViewController viewController: UIViewController) {
        viewController.view.frame = CGRect(x: 0, y: 0, width: self.summaryContainerView.frame.size.width, height: self.summaryContainerView.frame.size.height)
        self.summaryContainerView.addSubview(viewController.view)
    }


}
