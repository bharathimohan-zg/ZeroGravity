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
class CustomerDashBoardViewController: UIViewController {
    var segmentTitle:String = ""
    var quotationName:String = ""
    @IBOutlet weak var nodat: UILabel!
    @IBOutlet weak var segmentCntrl: ScrollableSegmentedControl!
    @IBOutlet weak var dashboardSegment: UISegmentedControl!
    var videoArray = ["Montage Video","Traditional Video","Candid Video","Candid Teaser","Photo Reel","Save the Date"]
    var videoDict = ["Montage Video":["Assigned","Editing Inprogress","Editing Completed","Link Shared"],"Traditional Video":["Assigned","Editing Inprogress","Editing Completed","Link Shared"],"Candid Video":["Assigned","Editing fInprogress","Editing Completed","Link Shared"],"Photo Reel":["Assigned","Editing Inprogress","Editing Completed","Link Shared"],"Candid Teaser":["Assigned","Editing Inprogress","Editing Completed","Link Shared"],"Save the Date":["Assigned","Editing Inprogress","Editing Completed","Link Shared"]]
    var photoArray = ["For Album","Insta","Frame","CC Pictures","Album"]
    var photoDict = ["For Album":["Assigned","Sorted","export","Link Shared"],"Insta":["Assigned","Sorted","Design Completed","Link Shared"],"Frame":["Assigned","Design Completed","Print In Progress Completed","Delivered"],"CC Pictures":["Assigned","Sorted","CC Completed","Link Shared"],"Album":["Image Received","Design Completed","Print In Progress","Delivered"]]

    var QuoteDict = ["1900111":["Engagement"],"1900112":["Engagement","Wedding reception"],"1900113":["Engagement","Wedding reception","Wedding"]]
    var photoVidieoArray = [Section]()
    var photoHeader = [Section]()

    @IBOutlet weak var dasboardTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        dashboardSegment.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Ubuntu-Light", size: 15)!], for: .normal)
        UIApplication.shared.statusBarUIView?.backgroundColor = UIColor(red: 241/255.0, green: 107/255.0, blue: 182/255.0, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor(red: 241/255.0, green: 107/255.0, blue: 182/255.0, alpha: 1)

        if #available(iOS 13.0, *) {
           dashboardSegment.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
           dashboardSegment.selectedSegmentTintColor = UIColor(red: 241/255.0, green: 107/255.0, blue: 182/255.0, alpha: 1)
        } else {
           dashboardSegment.tintColor = UIColor(red: 241/255.0, green: 107/255.0, blue: 182/255.0, alpha: 1)
        }
        dasboardTableView.register(UINib(nibName: "PaymentProcessTableViewCell", bundle: nil), forCellReuseIdentifier: "paymentIdentifier")
        dasboardTableView.register(UINib(nibName: "CustomerSummaryTableViewCell", bundle: nil), forCellReuseIdentifier: "summaryIdentifier")
        dasboardTableView.register(UINib(nibName: "PaymentTermsTableViewCell", bundle: nil), forCellReuseIdentifier: "paymentTermsIdentifier")
        dasboardTableView.register(UINib(nibName: "ProgressTableViewCell", bundle: nil), forCellReuseIdentifier: "progressIdentifier")
        dasboardTableView.register(UINib(nibName: "QuotationTabalviewCell", bundle: nil), forCellReuseIdentifier: "QuotationIdentifier")
        self.segmentTitle = "PHOTOS"
        self.nodat.isHidden = false
        self.dasboardTableView.isHidden = true
        segmentCntrl.segmentStyle = .imageOnLeft
        segmentCntrl.insertSegment(withTitle: "1900111", image: #imageLiteral(resourceName: "MyOrder"), at: 0)
        segmentCntrl.insertSegment(withTitle: "1900112", image: #imageLiteral(resourceName: "MyOrder"), at: 1)
        segmentCntrl.insertSegment(withTitle: "1900113", image: #imageLiteral(resourceName: "MyOrder"), at: 2)
        segmentCntrl.underlineHeight = 3.0
        segmentCntrl.underlineSelected = true
        segmentCntrl.selectedSegmentIndex = 0
        segmentCntrl.fixedSegmentWidth = true
        segmentCntrl.addTarget(self, action: #selector(CustomerDashBoardViewController.segmentSelected(sender:)), for: .valueChanged)
        self.quotationName = "1900111"
        self.reloadTbleInfo(titleValue: self.segmentTitle)
    }
  
    @objc func segmentSelected(sender:ScrollableSegmentedControl) {
        self.quotationName = sender.titleForSegment(at: sender.selectedSegmentIndex)!
        self.quotationSelect(quote: self.quotationName)
    }

    @IBAction func segmentSeleted(_ sender: UISegmentedControl) {
        let title = sender.titleForSegment(at: sender.selectedSegmentIndex)
        self.reloadTbleInfo(titleValue: title?.isEmpty == true ? "" : title!)
    }
    func quotationSelect(quote:String) {
        self.reloadTbleInfo(titleValue: self.segmentTitle)
    }
    func reloadTbleInfo(titleValue:String) {
        DispatchQueue.main.async {
            self.segmentTitle = titleValue
            self.photoVidieoArray.removeAll()
            self.photoHeader.removeAll()
            let infoArray = (self.segmentTitle == "PHOTOS") ? self.photoArray :  self.videoArray
            for infoKey in infoArray
            {
                self.photoVidieoArray.append(Section(name: infoKey ,items: (self.segmentTitle == "PHOTOS") ? self.photoDict[infoKey]! : self.videoDict[infoKey]! ))
            }
            if self.quotationName.isEmpty == true{
                self.dasboardTableView.isHidden = true
                self.nodat.isHidden = false
            } else {
                for quote in self.QuoteDict[self.quotationName]!
                {
                    self.photoHeader.append(Section(name: quote ,items: self.QuoteDict[self.quotationName]!))
                }
                if self.photoVidieoArray.count > 0
                {
                self.dasboardTableView.isHidden = false
                self.nodat.isHidden = true
                self.dasboardTableView.reloadData()
                }
            }
        }
    }
}

extension CustomerDashBoardViewController:UITableViewDataSource,UITableViewDelegate {

func numberOfSections(in tableView: UITableView) -> Int {
    return  (segmentTitle == "PHOTOS" || segmentTitle == "VIDEOS") ? photoHeader.count > 0 ? self.QuoteDict[self.quotationName]!.count : 0 : 1
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return (segmentTitle == "PHOTOS" || segmentTitle == "VIDEOS") ? (photoHeader[section].collapsed!) ? 0 : 1 : 3
}
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "HeaderView") as! CollapsibleTableViewHeader
        header.headrName.text = photoHeader[section].name
        header.expendCollapseBtn.tag = section
        header.indicateBtn.setImage(UIImage(named: photoHeader[section].collapsed ? "plus.png" : "minus.png"), for: .normal)
        header.expendCollapseBtn.addTarget(self, action: #selector(CustomerDashBoardViewController.toggleCollapse), for: .touchUpInside)
        header.clipsToBounds = true
        return header.contentView
    }
    
    @objc func toggleCollapse(sender: UIButton) {
        let section = sender.tag
        let collapsed = photoHeader[section].collapsed
        photoHeader[section].collapsed = !collapsed!
        dasboardTableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
    }
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if segmentTitle == "PHOTOS" || segmentTitle == "VIDEOS"
    {
        let cell = dasboardTableView.dequeueReusableCell(withIdentifier: "QuotationIdentifier", for: indexPath) as! QuotationTabalviewCell
        cell.segmentTitle = segmentTitle
        cell.photoVidieoArray = photoVidieoArray
        DispatchQueue.main.async {
        cell.quotationTable.reloadData()
        }
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
            return (segmentTitle == "PHOTOS" || segmentTitle == "VIDEOS") ? photoHeader[indexPath.section].collapsed ? CGFloat(photoVidieoArray.count * 50) : CGFloat(photoVidieoArray.count * 100) : 180
        case 1:
            return 190
        case 2:
            return 157
        default:
            return 0
        }
    }
}

class ButtonWithShadow: UIButton {

override func draw(_ rect: CGRect) {
    updateLayerProperties()
}

func updateLayerProperties() {
    self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
    self.layer.shadowOffset = CGSize(width: 0, height: 3)
    self.layer.shadowOpacity = 1.0
    self.layer.shadowRadius = 5.0
    self.layer.masksToBounds = false
    self.backgroundColor = UIColor(red: 171/255, green: 178/255, blue: 186/255, alpha: 1.0)
}
    
}

