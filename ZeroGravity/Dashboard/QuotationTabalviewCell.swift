//
//  QuotationTabalviewCell.swift
//  zerogravity
//
//  Created by Bharathimohan on 13/05/20.
//  Copyright © 2020 Bharathimohan. All rights reserved.
//

import UIKit

class QuotationTabalviewCell: UITableViewCell {

    @IBOutlet weak var quotationTable: UITableView!
    var photoVidieoArray = [Section]()
    var segmentTitle:String = ""

    override func awakeFromNib() {
        super.awakeFromNib()
        quotationTable.register(UINib(nibName: "ProgressTableViewCell", bundle: nil), forCellReuseIdentifier: "progressIdentifier")
        quotationTable.register(UINib(nibName: "QuotationHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "QuotationHeader")

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension QuotationTabalviewCell:UITableViewDataSource,UITableViewDelegate {

func numberOfSections(in tableView: UITableView) -> Int {
    return  (segmentTitle == "PHOTOS" || segmentTitle == "VIDEOS") ? photoVidieoArray.count > 0 ? photoVidieoArray.count : 0 : 1
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return (segmentTitle == "PHOTOS" || segmentTitle == "VIDEOS") ?  (photoVidieoArray[section].collapsed!) ? 0 : 1 : 3
}
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "QuotationHeader") as! QuotationHeaderTableViewCell
        header.headrName.text = photoVidieoArray[section].name
        header.expendCollapseBtn.tag = section
        header.indicateBtn.setImage(UIImage(named: photoVidieoArray[section].collapsed ? "plus.png" : "minus.png"), for: .normal)
        header.expendCollapseBtn.addTarget(self, action: #selector(self.toggleCollapse), for: .touchUpInside)
        header.clipsToBounds = true
        return header.contentView
    }
    
    @objc func toggleCollapse(sender: UIButton) {
        let section = sender.tag
        let collapsed = photoVidieoArray[section].collapsed
        photoVidieoArray[section].collapsed = !collapsed!
        quotationTable.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
    }
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if segmentTitle == "PHOTOS"
    {
        let cell = quotationTable.dequeueReusableCell(withIdentifier: "progressIdentifier", for: indexPath) as! ProgressTableViewCell
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
    else
    {
        let cell = quotationTable.dequeueReusableCell(withIdentifier: "progressIdentifier", for: indexPath) as! ProgressTableViewCell
        cell.addressLine1.isHidden = false
        cell.addressLine2.isHidden = false
        cell.zipcode.isHidden = false
        cell.progressArray = photoVidieoArray[indexPath.section].items
        cell.addressTitle.text = "Mailing Address"
        cell.name.text = "Vikas Alagarsamy"
        cell.setupprogressBar()
        return cell
    }
}
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return (segmentTitle == "PHOTOS" || segmentTitle == "VIDEOS") ? 50 : 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return (segmentTitle == "PHOTOS" || segmentTitle == "VIDEOS") ? 445 : 180
        case 1:
            return 190
        case 2:
            return 157
        default:
            return 0
        }
    }
}
