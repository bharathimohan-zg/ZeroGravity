//
//  OrderDetailsTableViewCell.swift
//  zerogravity
//
//  Created by Bharathimohan on 26/08/19.
//  Copyright © 2019 Bharathimohan. All rights reserved.
//

import UIKit
let summaryInfoArray = ["",""]

class OrderDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var orderCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class SummaryInfoCell: UICollectionViewCell,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var summaryTable: UITableView!
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return summaryInfoArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SummaryCellIdentifier", for: indexPath) as! SummaryTableViewCell
            if let templateImage = UIImage(named: "Status")?.withRenderingMode(.alwaysTemplate) {
                let imageView = UIImageView(image: templateImage)
                cell.summaryStatusImage.image = imageView.image
                cell.summaryStatusImage.tintColor = LoginViewController.hexStringToUIColor(hex: hexaColor)
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SummarySecondIdentifier", for: indexPath) as! SummarySeconTableViewCell
            if let templateImage = UIImage(named: "Status")?.withRenderingMode(.alwaysTemplate) {
                let imageView = UIImageView(image: templateImage)
                cell.summaryStatusImg.image = imageView.image
                cell.summaryStatusImg.tintColor = LoginViewController.hexStringToUIColor(hex: hexaColor)
            }
            if (summaryInfoArray.count - 1) == indexPath.row
            {
                cell.statusView.isHidden = true
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74
    }
    
}

class SummaryHeaderView: UICollectionReusableView{
    @IBOutlet weak var heasderCountView: UIView!
}

extension OrderDetailsTableViewCell: UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var reusable: UICollectionReusableView? = nil
        if (kind == UICollectionView.elementKindSectionHeader){
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SummaryHeaderIdentifier", for: indexPath) as! SummaryHeaderView
            view.heasderCountView.layer.cornerRadius = view.heasderCountView.frame.size.width/2
            view.heasderCountView.clipsToBounds = true
            view.heasderCountView.layer.borderColor = UIColor.white.cgColor
            view.heasderCountView.layer.borderWidth = 5.0
            
            reusable = view
        }
        return reusable!
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SummaryCollectiondentifier", for: indexPath as IndexPath) as! SummaryInfoCell
        cell.summaryTable.reloadData()
        return cell
    }
}
extension OrderDetailsTableViewCell: UICollectionViewDelegateFlowLayout{
    
    fileprivate var sectionInsets: UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    fileprivate var itemsPerRow: CGFloat {
        return 1
    }
    
    fileprivate var interitemSpace: CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: orderCollectionView.frame.width, height: CGFloat(summaryInfoArray.count) * 174)
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
