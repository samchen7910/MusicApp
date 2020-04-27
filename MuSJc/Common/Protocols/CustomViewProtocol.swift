//
//  CustomViewProtocol.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/25/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import Foundation
import UIKit

protocol CustomViewProtocol {
	var contentView: UIView! { get }
	func commonInit(for name: String)
}

extension CustomViewProtocol where Self: UIView {
	func commonInit(for name: String) {
		Bundle.main.loadNibNamed(name, owner: self, options: nil)
		addSubview(contentView)
		contentView.backgroundColor = .clear
		contentView.frame = bounds
		contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
	}
}
