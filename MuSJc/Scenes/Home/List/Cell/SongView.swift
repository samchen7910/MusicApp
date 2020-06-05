//
//  SongView.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 5/8/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import UIKit

class SongView: UICollectionViewCell {
	
	@IBOutlet weak var songImageView: UIImageView!
	@IBOutlet weak var songNameLabel: UILabel!
	@IBOutlet weak var authorLabel: UILabel!
	@IBOutlet weak var dotsButton: UIImageView!
	
	override func prepareForReuse() {
		super.prepareForReuse()
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		songImageView.layer.cornerRadius = 8
		songImageView.layer.masksToBounds = true
	}
	
	static var identifier: String {
		return String(describing: SongView.self)
	}
	
	func setup() {
		// TO DO
	}
}
