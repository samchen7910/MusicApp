//
//  SmallPlayerCustomView.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/28/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//
import UIKit

protocol SmallPlayerCustomViewDelegate: class {
	func playButtonTapped()
}

class SmallPlayerCustomView: UIView, CustomViewProtocol {
	
	@IBOutlet var contentView: UIView!

	@IBOutlet weak var discImageView: UIImageView!
	@IBOutlet weak var songNameLabel: UILabel!
	@IBOutlet weak var authorNameLabel: UILabel!
	@IBOutlet weak var playButton: UIButton! {
		didSet {
			playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
		}
	}
	
	private var isPlaying = false
	private var delegate: SmallPlayerCustomViewDelegate?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit(for: "SmallPlayerCustomView")
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit(for: "SmallPlayerCustomView")
	}

	override func awakeFromNib() {
		super.awakeFromNib()
		discImageView.layer.cornerRadius = discImageView.frame.height/2
		discImageView.layer.masksToBounds = true
	}
	
	func set(delegate: SmallPlayerCustomViewDelegate) {
		self.delegate = delegate
	}
	
	@objc func playButtonTapped() {
		isPlaying.toggle()
		if isPlaying {
			UIView.animate(withDuration: 0.7, animations: {
				self.discImageView.rotate()
			})
		} else {
			UIView.animate(withDuration: 0.7, animations: {
				self.discImageView.layer.removeAnimation(forKey: "rotationAnimation")
			})
		}
	}
}

