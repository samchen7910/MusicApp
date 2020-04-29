//
//  ListViewController.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/25/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import UIKit

//sourcery: AutoMockable
protocol ListViewControllerProtocol: class, UIViewControllerRouting {
	
}

class ListViewController: UIViewController {
	
	@IBOutlet weak var containerView: UIView!
	@IBOutlet weak var containerViewHeight: NSLayoutConstraint!
	
	private weak var subViewController: UIViewController?
	var swipeDown: UISwipeGestureRecognizer?
	var swipeUp: UISwipeGestureRecognizer?
	var isShowing: Bool = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	@IBOutlet weak var openMusicButton: UIButton! {
		didSet {
			openMusicButton.addTarget(self, action: #selector(openMusicDetail), for: .touchUpInside)
		}
	}
	
	@objc func openMusicDetail() {
		isShowing.toggle()
		if isShowing {
			// To do:
			guard let songDetailVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "SongDetailViewController") as? SongDetailViewController else {
				return assertionFailure("Can't retrieve SongDetailVC")
			}
			songDetailVC.set(delegate: self)
			self.children.forEach({
				$0.willMove(toParent: nil)
				$0.view.removeFromSuperview()
				$0.removeFromParent()
			})
			containerView.isHidden = !isShowing
			songDetailVC.view.translatesAutoresizingMaskIntoConstraints = false
			addChild(songDetailVC)
			containerViewHeight.constant = self.view.frame.height
			containerViewHeight.isActive = true
			subViewController = songDetailVC
			containerView.addSubview(songDetailVC.view)
			songDetailVC.view.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
			songDetailVC.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
			songDetailVC.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
			songDetailVC.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
			songDetailVC.didMove(toParent: self)
		}
	}
}

extension ListViewController: SongDetailViewControllerDelegate {
	
	func isMinimized() -> Bool {
		return CGFloat((self.view.frame.origin.y)) > CGFloat(20)
	}
	
	func minimizeWindow(minimized: Bool, animated: Bool) {
		
		var containerHeight: CGFloat
		
		if minimized == true {
			containerHeight = 90
		} else {
			containerHeight = view.frame.height
		}
		
		let duration: TimeInterval = (animated) ? 0.5 : 0.0
		UIView.animate(withDuration: duration, animations: {
			self.containerViewHeight?.constant = containerHeight
			self.containerViewHeight?.isActive = true
			self.view.layoutIfNeeded()
		})
	}
}

extension ListViewController: ListViewControllerProtocol {
	
}

