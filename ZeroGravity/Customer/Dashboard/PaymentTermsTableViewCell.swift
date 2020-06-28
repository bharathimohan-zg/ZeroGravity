//
//  PaymentTermsTableViewCell.swift
//  zerogravity
//
//  Created by Bharathimohan on 30/08/19.
//  Copyright © 2019 Bharathimohan. All rights reserved.
//

import UIKit

class TermsCollectionViewCell: UICollectionViewCell,UITableViewDataSource,UITableViewDelegate {
    
    var titleValue:String = ""
    var paymentTitleArray:[String] = []
    @IBOutlet weak var paymentTypeTable: UITableView?

    override func layoutSubviews() {
        paymentTypeTable?.register(UINib(nibName: "TermsStatusTableViewCell", bundle: nil), forCellReuseIdentifier: "TermsStatusIdentifier")
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleValue
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        if let textlabel = header.textLabel {
            textlabel.font = UIFont(name: FONT.Ubuntu.rawValue, size: 15)
            textlabel.textAlignment = .center
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  paymentTitleArray.count > 0 ? paymentTitleArray.count : 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TermsStatusIdentifier", for: indexPath) as! TermsStatusTableViewCell
        cell.termsLable.text = paymentTitleArray[indexPath.row]
        return cell
    }
}

class PaymentTermsTableViewCell: UITableViewCell {
    var paymentTitleArray = ["Payment Type","Payment Date","Amount"]
    var paymentInfoDict = ["Payment Type":["Advance","Due"],"Payment Date":["26-08-2019","02-09-2019"],"Amount":["100000","200000"]]

    @IBOutlet weak var paymentCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.paymentCollectionView.register(UINib(nibName: "TermsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TermsIdentifier")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension PaymentTermsTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return paymentTitleArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : TermsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TermsIdentifier", for: indexPath) as! TermsCollectionViewCell
        let paymentType = paymentTitleArray[indexPath.row]
        let paymentInfoArray = paymentInfoDict[paymentType]
        cell.titleValue = paymentType
        cell.paymentTitleArray = paymentInfoArray!
        cell.paymentTypeTable?.reloadData()
        return cell
    }
}
extension PaymentTermsTableViewCell: UICollectionViewDelegateFlowLayout{
    
    fileprivate var sectionInsets: UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    fileprivate var itemsPerRow: CGFloat {
        return 3
    }
    
    fileprivate var interitemSpace: CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sectionPadding = sectionInsets.left * (itemsPerRow + 1)
        let interitemPadding = max(0.0, itemsPerRow - 1) * interitemSpace
        let availableWidth = collectionView.bounds.width - sectionPadding - interitemPadding
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem , height: widthPerItem )
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return interitemSpace
    }
}
