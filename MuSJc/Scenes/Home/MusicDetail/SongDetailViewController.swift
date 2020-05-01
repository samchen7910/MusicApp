//
//  SongDetailViewController.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/30/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import UIKit
import Hero

protocol SongDetailViewControllerDelegate: class {
	func minimizeWindow(minimized: Bool, animated: Bool)
}

protocol SongDetailViewControllerProtocol: class, UIViewControllerRouting {
	
}

class SongDetailViewController: UIViewController {
	
	private weak var delegate: SongDetailViewControllerDelegate?
	
	@IBOutlet weak var backgroundImage: UIImageView!
	@IBOutlet weak var overlayView: UIView! {
		didSet {
			overlayView.alpha = 0.25
		}
	}
	@IBOutlet weak var musicDetailView: MusicDetailView!
	
	func set(delegate: SongDetailViewControllerDelegate) {
		self.delegate = delegate
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		musicDetailView.delegate = self
		musicDetailView.backgroundColor = .clear
		self.hero.isEnabled = true
		backgroundImage.hero.id = "CategoryViewImage"

	}
	
}

extension SongDetailViewController: MusicDetailViewDelegate {
	func minimizeWindow(minimized: Bool, animated: Bool) {
		setup(minimized)
		delegate?.minimizeWindow(minimized: minimized, animated: animated)
	}
	
	func setup(_ isMinimized: Bool) {
		overlayView.alpha = isMinimized ? 0 :  0.25
		backgroundImage.alpha = isMinimized ? 0 : 1
	}
}

extension SongDetailViewController: SongDetailViewControllerProtocol {
	
}
