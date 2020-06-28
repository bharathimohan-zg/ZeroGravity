//
//  TopCornerView.swift
//  zerogravity
//
//  Created by Bharathimohan on 10/06/20.
//  Copyright © 2020 Bharathimohan. All rights reserved.
//

import Foundation
import UIKit

class TopCornerView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.roundCorners([.topLeft, .topRight], radius: 20)
    }
}

extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         self.layer.mask = mask
    }
}
