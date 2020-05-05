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
	@IBOutlet weak var threeDotsButton: UIButton! {
		didSet {
			threeDotsButton.addTarget(self, action: #selector(threeDotsButtonTapped), for: .touchUpInside)
		}
	}
	@IBOutlet weak var backgroundImage: UIImageView!
	@IBOutlet weak var overlayView: UIView! {
		didSet {
			overlayView.alpha = 0.25
		}
	}
	@IBOutlet weak var musicDetailView: MusicDetailView!
	@IBOutlet weak var dropDownButton: UIButton! {
		didSet {
			dropDownButton.addTarget(self, action: #selector(dropDownButtonTapped), for: .touchUpInside)
		}
	}
	@IBOutlet weak var topBarLabel: UILabel!
	@IBOutlet weak var visualEffectView: UIVisualEffectView!
	private var rightMenuView: SmallMenuView?
	private var effect: UIVisualEffect?
	private var isRotated = false
	
	func set(delegate: SongDetailViewControllerDelegate) {
		self.delegate = delegate
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		visualEffectView.effect = nil
		prepareForHero()
	}
	
	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		prepare()
	}
	
	
	private func prepare() {
		musicDetailView.delegate = self
		musicDetailView.backgroundColor = .clear
		//		backgroundImage.layer.cornerRadius = backgroundImage.frame.height/4
		//		overlayView.layer.cornerRadius = overlayView.frame.height/4
		//		overlayView.layer.maskedCorners = [.layerMaxXMaxYCorner]
		//		backgroundImage.layer.maskedCorners = [.layerMaxXMaxYCorner]
		//		backgroundImage.layer.masksToBounds = true
	}
	
	func prepareForHero() {
		hero.isEnabled = true
		backgroundImage.hero.isEnabled = true
		backgroundImage.hero.id = "CategoryViewImage"
	}
	
	func disableHero() {
		backgroundImage.hero.isEnabled = false
	}
	
	@objc func threeDotsButtonTapped() {
		isRotated.toggle()
		
		UIView.animate(withDuration: 0.3) { [weak self, isRotated] in
			guard let self = self else { return }
			self.threeDotsButton.transform = isRotated ? CGAffineTransform(rotationAngle: 90 * CGFloat.pi/4) : .identity
			self.openRightMenu(isRotated)
			self.view.layoutIfNeeded()
		}
	}
	
	@objc func dropDownButtonTapped() {
		musicDetailView.alpha = 0
		view.alpha = 0
		dismiss(animated: true, completion: nil)
	}
	
}

extension SongDetailViewController: MusicDetailViewDelegate {
	func minimizeWindow(minimized: Bool, animated: Bool) {
		self.view.alpha = 0
		dismiss(animated: true, completion: nil)
	}
	
}

private extension SongDetailViewController {
	
	func openRightMenu(_ isOpen: Bool) {
		dropDownButton.alpha = isOpen ? 0 : 1
		topBarLabel.alpha = isOpen ? 0 : 1
		visualEffectView.effect = isOpen ? UIBlurEffect(style: .regular) : nil
		_ = isOpen ? addRightMenuView() : rightMenuView?.removeFromSuperview()
	}
	
	func addRightMenuView() {
		self.rightMenuView?.removeFromSuperview()
		let rightMenuView = SmallMenuView()
		rightMenuView.translatesAutoresizingMaskIntoConstraints = false
		self.rightMenuView = rightMenuView
		view.addSubview(self.rightMenuView!)
		self.rightMenuView!.widthAnchor.constraint(equalToConstant: view.frame.width * 0.9).isActive = true
		self.rightMenuView!.heightAnchor.constraint(equalToConstant: 150).isActive = true
		self.rightMenuView!.topAnchor.constraint(equalTo: threeDotsButton.bottomAnchor, constant: 8).isActive = true
		self.rightMenuView!.trailingAnchor.constraint(equalTo: threeDotsButton.trailingAnchor, constant: -8).isActive = true
		rightMenuView.layer.cornerRadius = 25
		rightMenuView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
		rightMenuView.layer.masksToBounds = true
		
	}
}

extension SongDetailViewController: SongDetailViewControllerProtocol {
	
}
