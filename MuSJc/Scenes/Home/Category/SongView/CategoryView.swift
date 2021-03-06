//
//  CategoryView.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 5/1/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import UIKit

class CategoryView: UICollectionViewCell {
	
	@IBOutlet weak var overlayView: UIView!
	@IBOutlet weak var backgroundImageView: UIImageView! {
		didSet {
			backgroundImageView.hero.id = "CategoryViewImage"
		}
	}
	
	static var identifier: String {
		return String(describing: CategoryView.self)
	}
	
	init() {
		super.init(frame: CGRect())
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		setUp()
	}
	
	func setUp() {
		self.layer.cornerRadius = 25
		self.layer.masksToBounds = true
	}

	func prepareForHeroTransition() {
		backgroundImageView.hero.isEnabled = true
	}
	
	func disableHero() {
		backgroundImageView.hero.isEnabled = false
	}
}
