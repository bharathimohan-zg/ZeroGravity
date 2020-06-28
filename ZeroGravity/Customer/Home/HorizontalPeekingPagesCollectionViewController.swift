//
//  CollectionViewPeekingPages.swift
//  CollectionViewPeekingPages
//
//  Created by Shai Balassiano on 06/04/2018.
//  Copyright © 2018 Shai Balassiano. All rights reserved.
//

import UIKit

class HorizontalPeekingPagesCollectionViewController: UICollectionViewController {
    private var indexOfCellBeforeDragging = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    func calculateSectionInset() -> CGFloat { // should be overridden
        return (loginType == "Event") ? 0 : 100
    }
}
