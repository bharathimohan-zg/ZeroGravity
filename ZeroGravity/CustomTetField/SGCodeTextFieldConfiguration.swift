//
//  SGCodeTextFieldConfiguration.swift
//  SGCodeTextField
//
//  Created by Sergiu Grigoriev on 08/01/2019.
//  Copyright © 2019 Sergiu Grigoriev. All rights reserved.
//

import Foundation
import UIKit

struct SGCodeTextFieldConfiguration {
	var keyboardType: UIKeyboardType = .numberPad
	var font: UIFont = UIFont.systemFont(ofSize: 18.0)
	var digitCornerRadius: CGFloat = 5.0
	var digitBackgroundColor: UIColor = LoginViewController.hexStringToUIColor(hex: "#E5E5E5")
	var digitBackgroundColorFocused: UIColor = UIColor.lightGray
	var digitBorderColor: UIColor = UIColor.gray
	var digitBorderColorFocused: UIColor = UIColor.green
	var digitBorderWidth: CGFloat = 1.0
}
