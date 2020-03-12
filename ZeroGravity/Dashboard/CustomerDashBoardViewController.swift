//
//  CustomerDashBoardViewController.swift
//  zerogravity
//
//  Created by Bharathimohan on 12/08/19.
//  Copyright © 2019 Bharathimohan. All rights reserved.
//

import UIKit
import ScrollableSegmentedControl
import FlexibleSteppedProgressBar
class CustomerDashBoardViewController: UIViewController {
    var segmentTitle:String = ""
//    @IBOutlet weak var scrollobleSegmentView: ScrollableSegmentedControl!
    @IBOutlet weak var dashboardSegment: UISegmentedControl!
    var videoArray = ["Montage Video","Traditional Video","Candid Video","Candid Teaser","Photo Reel","Save the Date"]
    var videoDict = ["Montage Video":["Assigned","Editing \nInprogress","Editing \nCompleted","Link \nShared"],"Traditional Video":["Assigned","Editing \nInprogress","Editing \nCompleted","Link \nShared"],"Candid Video":["Assigned","Editing \nInprogress","Editing \nCompleted","Link \nShared"],"Photo Reel":["Assigned","Editing \nInprogress","Editing \nCompleted","Link \nShared"],"Candid Teaser":["Assigned","Editing \nInprogress","Editing \nCompleted","Link \nShared"],"Save the Date":["Assigned","Editing \nInprogress","Editing \nCompleted","Link \nShared"]]
    var photoArray = ["For Album","Insta","Frame","CC Pictures","Album"]
    var photoDict = ["For Album":["Assigned","Sorted","export","Link \nShared"],"Insta":["Assigned","Sorted","Design \nCompleted","Link \nShared"],"Frame":["Assigned","Design \nCompleted","Print In Progress Completed","Delivered"],"CC Pictures":["Assigned","Sorted","CC \nCompleted","Link \nShared"],"Album":["Image \nReceived","Design \nCompleted","Print In Progress","Delivered"]]

    struct Section {
        var name: String!
        var items: [String]!
        var collapsed: Bool!
        init(name: String, items: [String], collapsed: Bool = true) {
            self.name = name
            self.items = items
            self.collapsed = collapsed
        }
    }
    var photoVidieoArray = [Section]()

    @IBOutlet weak var dasboardTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor(red: 241/255.0, green: 107/255.0, blue: 182/255.0, alpha: 1)
        dashboardSegment.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Ubuntu-Light", size: 15)!], for: .normal)
        
        if #available(iOS 13.0, *) {
           dashboardSegment.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
           dashboardSegment.selectedSegmentTintColor = UIColor(red: 241/255.0, green: 107/255.0, blue: 182/255.0, alpha: 1)
        } else {
           dashboardSegment.tintColor = UIColor(red: 241/255.0, green: 107/255.0, blue: 182/255.0, alpha: 1)
        }

//        scrollobleSegmentView.segmentStyle = .textOnly
//        scrollobleSegmentView.insertSegment(withTitle: "PHOTOS", image:#imageLiteral(resourceName: "MyAccount") , at: 0)
//        scrollobleSegmentView.insertSegment(withTitle: "VIDEOS", image: #imageLiteral(resourceName: "Account"), at: 1)
//        scrollobleSegmentView.insertSegment(withTitle: "PAYMENT DUE", image: #imageLiteral(resourceName: "Dashboard"), at: 2)
//        scrollobleSegmentView.underlineSelected = true
//        scrollobleSegmentView.selectedSegmentIndex = 0
//        scrollobleSegmentView.addTarget(self, action: #selector(CustomerDashBoardViewController.segmentSelected(sender:)), for: .valueChanged)
//        scrollobleSegmentView.tintColor = UIColor(red: 241/255.0, green: 107/255.0, blue: 182/255.0, alpha: 1)
//        // change some colors
//        scrollobleSegmentView.segmentContentColor = UIColor(red: 235/255.0, green: 236/255.0, blue: 237/255.0, alpha: 1)
//        scrollobleSegmentView.selectedSegmentContentColor = .white
//        scrollobleSegmentView.backgroundColor = UIColor(red: 241/255.0, green: 107/255.0, blue: 182/255.0, alpha: 1)
//        scrollobleSegmentView.fixedSegmentWidth = true
//        scrollobleSegmentView.tintColor = .white
        dasboardTableView.register(UINib(nibName: "PaymentProcessTableViewCell", bundle: nil), forCellReuseIdentifier: "paymentIdentifier")
        dasboardTableView.register(UINib(nibName: "CustomerSummaryTableViewCell", bundle: nil), forCellReuseIdentifier: "summaryIdentifier")
        dasboardTableView.register(UINib(nibName: "PaymentTermsTableViewCell", bundle: nil), forCellReuseIdentifier: "paymentTermsIdentifier")
        dasboardTableView.register(UINib(nibName: "ProgressTableViewCell", bundle: nil), forCellReuseIdentifier: "progressIdentifier")
        self.reloadTbleInfo(titleValue: "PHOTOS")
    }
    
    @IBAction func segmentSeleted(_ sender: UISegmentedControl) {
        let title = sender.titleForSegment(at: sender.selectedSegmentIndex)
        self.reloadTbleInfo(titleValue: title?.isEmpty == true ? "" : title!)
    }
//    @objc func segmentSelected(sender:ScrollableSegmentedControl) {
//
//        self.reloadTbleInfo(titleValue: scrollobleSegmentView.titleForSegment(at:scrollobleSegmentView.selectedSegmentIndex)!)
//        }

    func reloadTbleInfo(titleValue:String) {
        DispatchQueue.main.async {
            self.segmentTitle = titleValue
            self.photoVidieoArray.removeAll()
            let infoArray = (self.segmentTitle == "PHOTOS") ? self.photoArray :  self.videoArray
            for infoKey in infoArray
            {
                self.photoVidieoArray.append(Section(name: infoKey ,items: (self.segmentTitle == "PHOTOS") ? self.photoDict[infoKey]! : self.videoDict[infoKey]! ))
            }
            if self.photoVidieoArray.count > 0
            {
            self.dasboardTableView.reloadData()
            }
        }
    }
}

extension CustomerDashBoardViewController:UITableViewDataSource,UITableViewDelegate {

func numberOfSections(in tableView: UITableView) -> Int {
    return  (segmentTitle == "PHOTOS" || segmentTitle == "VIDEOS") ? photoVidieoArray.count > 0 ? photoVidieoArray.count : 0 : 1
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return (segmentTitle == "PHOTOS" || segmentTitle == "VIDEOS") ?  (photoVidieoArray[section].collapsed!) ? 0 : 1 : 3
}
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "HeaderView") as! CollapsibleTableViewHeader
        header.headrName.text = photoVidieoArray[section].name
        header.expendCollapseBtn.tag = section
        header.indicateBtn.setImage(UIImage(named: photoVidieoArray[section].collapsed ? "plus.png" : "minus.png"), for: .normal)
        header.expendCollapseBtn.addTarget(self, action: #selector(CustomerDashBoardViewController.toggleCollapse), for: .touchUpInside)
        header.clipsToBounds = true
        return header.contentView
    }
    
    @objc func toggleCollapse(sender: UIButton) {
        let section = sender.tag
        let collapsed = photoVidieoArray[section].collapsed
        photoVidieoArray[section].collapsed = !collapsed!
        dasboardTableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
    }
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if segmentTitle == "PHOTOS"
    {
        let cell = dasboardTableView.dequeueReusableCell(withIdentifier: "progressIdentifier", for: indexPath) as! ProgressTableViewCell
        cell.progressArray = photoVidieoArray[indexPath.section].items
        if photoVidieoArray[indexPath.section].name == "Frame" || photoVidieoArray[indexPath.section].name == "Album"
        {
            cell.addressTitle.text = "Shipping Address"
            cell.addressLine1.isHidden = false
            cell.addressLine2.isHidden = false
            cell.zipcode.isHidden = false
            cell.name.text = "Vikas Alagarsamy"
        }
        else
        {
            cell.addressTitle.text = "Mailing Address"
            cell.addressLine1.isHidden = true
            cell.addressLine2.isHidden = true
            cell.zipcode.isHidden = true
            cell.name.text = "vikas.alagarsamy@gmail.com"
        }
        cell.setupprogressBar()
        return cell
    }
    else if segmentTitle == "VIDEOS"
    {
        let cell = dasboardTableView.dequeueReusableCell(withIdentifier: "progressIdentifier", for: indexPath) as! ProgressTableViewCell
        cell.addressLine1.isHidden = false
        cell.addressLine2.isHidden = false
        cell.zipcode.isHidden = false
        cell.progressArray = photoVidieoArray[indexPath.section].items
        cell.addressTitle.text = "Mailing Address"
        cell.name.text = "Vikas Alagarsamy"
        cell.setupprogressBar()
        return cell
    }
    else
    {
    switch indexPath.row {
    case 0:
        let cell = dasboardTableView.dequeueReusableCell(withIdentifier: "paymentIdentifier", for: indexPath) as! PaymentProcessTableViewCell
        return cell
    case 1:
        let cell = dasboardTableView.dequeueReusableCell(withIdentifier: "summaryIdentifier", for: indexPath) as! CustomerSummaryTableViewCell
        return cell
    case 2:
        let cell = dasboardTableView.dequeueReusableCell(withIdentifier: "paymentTermsIdentifier", for: indexPath) as! PaymentTermsTableViewCell
        return cell
    default:
        return UITableViewCell()
    }
    }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return (segmentTitle == "PHOTOS" || segmentTitle == "VIDEOS") ? 50 : 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return (segmentTitle == "PHOTOS" || segmentTitle == "VIDEOS") ? 338 : 180
        case 1:
            return 190
        case 2:
            return 157
        default:
            return 0
        }
    }
}
