//
//  HomeCollectionViewController.swift
//  zerogravity
//
//  Created by Bharathimohan on 20/08/19.
//  Copyright © 2019 Bharathimohan. All rights reserved.
//

import UIKit

private let reuseIdentifier = "HomeIdentifier"

class HomeCollectionViewController: HorizontalPeekingPagesCollectionViewController,UIPageViewControllerDelegate {
    var pageControl = UIPageControl()
    var dataSource = ["IMG1", "IMG2", "IMG3", "IMG4", "IMG5"] {
        didSet {
            collectionView?.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageControl()
    }
    func configurePageControl() {
       self.pageControl = UIPageControl(frame: CGRect(x: 0, y: 170, width: self.view.frame.width, height: 17))
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
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeIdentifier", for: indexPath as IndexPath) as! HomesliderCell
        cell.deviceImg.image = UIImage(named:dataSource[indexPath.row])
        return cell
    }
    
    //    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    //        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
    //        pageControl.currentPage = Int(pageNumber)
    //    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
        let index = scrollView.contentOffset.x / witdh
        let roundedIndex = round(index)
        self.pageControl.currentPage = Int(roundedIndex)
    }

}

