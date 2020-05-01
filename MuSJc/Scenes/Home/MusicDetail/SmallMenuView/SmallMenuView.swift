//
//  SmallMenuView.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 5/2/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import UIKit

class SmallMenuView: UIView {
	
	@IBOutlet var contentView: UIView!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit(for: "SmallMenuView")
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit(for: "SmallMenuView")
	}
	
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
}

extension SmallMenuView: CustomViewProtocol {}
