//
//  MusicDetailView.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/28/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import UIKit

protocol MusicDetailViewDelegate: class {
	func minimizeWindow(minimized: Bool, animated: Bool)
}

class MusicDetailView: UIView, CustomViewProtocol {
	
	@IBOutlet var contentView: UIView!
	@IBOutlet weak var overlayView: UIView! {
		didSet {
			overlayView.alpha = 0.25
		}
	}
	
	@IBOutlet weak var containerView: UIView!
	
	@IBOutlet weak var backgroundImageView: UIImageView!
	@IBOutlet weak var bigPlayerView: PlayerCustomView!
	@IBOutlet weak var smallerPlayerView: SmallPlayerCustomView! {
		didSet {
			smallerPlayerView.alpha = 0 
		}
	}
	private var swipeDown: UISwipeGestureRecognizer?
	private var swipeUp: UISwipeGestureRecognizer?
	weak var delegate: MusicDetailViewDelegate?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit(for: "MusicDetailView")
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit(for: "MusicDetailView")
	}

	override func awakeFromNib() {
		super.awakeFromNib()
		prepare()
	}
	
	func setAnimation(isSwipeDown: Bool) {
		UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
			self.containerView.alpha = isSwipeDown ? 0 : 1
			self.smallerPlayerView.alpha = isSwipeDown ? 1 : 0
		}, completion: nil)
	}
}

// MARK: - Actions
@objc extension MusicDetailView {
	
	func swipeDownAction() {
		print("swipe down")
		setAnimation(isSwipeDown: true)
		delegate?.minimizeWindow(minimized: true, animated: true)
	}
	
	func swipeUpAction() {
		print("swipe up")
		setAnimation(isSwipeDown: false)
		delegate?.minimizeWindow(minimized: false, animated: true)
	}
}

// MARK: - Private
private extension MusicDetailView {
	
	func prepare() {
		swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeDownAction))
		swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeUpAction))
		swipeDown?.direction = .down
		swipeUp?.direction = .up
		self.contentView.addGestureRecognizer(swipeDown!)
		self.contentView.addGestureRecognizer(swipeUp!)
		
	}
}
