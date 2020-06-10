//
//  HomeCollectionViewController.swift
//  zerogravity
//
//  Created by Bharathimohan on 20/08/19.
//  Copyright © 2019 Bharathimohan. All rights reserved.
//

import UIKit
import MMBannerLayout
private let reuseIdentifier = "HomeIdentifier"

class HomeCollectionViewController: HorizontalPeekingPagesCollectionViewController,UIPageViewControllerDelegate {
    var pageControl = UIPageControl()
    var dataSource = ["IMG1", "IMG2", "IMG3", "IMG4", "IMG5"] {
        didSet {
            collectionView?.reloadData()
        }
    }
    @IBOutlet var HomecollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageControl()
        self.view.layoutIfNeeded()
        HomecollectionView.showsHorizontalScrollIndicator = false
        if let layout = HomecollectionView.collectionViewLayout as? MMBannerLayout {
            let inset: CGFloat = 50
            layout.itemSpace = 5
            layout.itemSize = CGSize(width: layout.collectionView!.frame.size.width - inset * 2, height: layout.collectionView!.frame.size.height)
            layout.minimuAlpha = 1.0
        }
        (HomecollectionView.collectionViewLayout as? MMBannerLayout)?.setInfinite(isInfinite: true, completed: nil)
    }
    
    func configurePageControl() {
       self.pageControl = UIPageControl(frame: CGRect(x: 0, y: 176, width: self.view.frame.width, height: 15))
        self.pageControl.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        self.pageControl.numberOfPages = dataSource.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.red
        self.pageControl.pageIndicatorTintColor = UIColor.lightGray
        self.pageControl.currentPageIndicatorTintColor = UIColor(red: 241/255.0, green: 107/255.0, blue: 182/255.0, alpha: 1)
        self.view.addSubview(pageControl)
    }

    override func calculateSectionInset() -> CGFloat {
        return 40
    }
    public override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    public override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeIdentifier", for: indexPath) as? HomesliderCell {
            cell.deviceImg.image = UIImage(named:dataSource[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }

}

extension HomeCollectionViewController: BannerLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, focusAt indexPath: IndexPath?) {
        if let indesPostion = indexPath?.row {
        self.pageControl.currentPage = indesPostion
        }
    }
}
