//
//  ListViewController.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/25/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import UIKit
import Hero

//sourcery: AutoMockable
protocol ListViewControllerProtocol: class, UIViewControllerRouting {
	
}

class ListViewController: UIViewController {
	
	@IBOutlet weak var containerView: UIView!
	@IBOutlet weak var containerViewHeight: NSLayoutConstraint!
	@IBOutlet weak var collectionView: UICollectionView!
	
	private weak var subViewController: UIViewController? // To do: should remove?
	var swipeDown: UISwipeGestureRecognizer?
	var swipeUp: UISwipeGestureRecognizer?
	var isShowing: Bool = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setUpCollectionView()
	}
	

	
	private func setUpCollectionView() {
		collectionView.dataSource = self
		collectionView.delegate = self
		
		collectionView.register(UINib(nibName: CategoryView.identifier, bundle: nil),
								forCellWithReuseIdentifier: CategoryView.identifier)
		
		setupCollectionViewLayout()
	}
	
	private func setupCollectionViewLayout() {
		guard let flow = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
			return
		}
		flow.minimumLineSpacing = view.frame.width * 0.1
		flow.itemSize = CGSize(width: view.frame.width * 0.8, height: view.frame.height * 0.4)
	}
	
	
	
	func openMusicDetail() {
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
			UIView.transition(with: containerView, duration: 0.3, options: [.transitionFlipFromTop], animations: {
				self.containerView.addSubview(songDetailVC.view)
				songDetailVC.view.topAnchor.constraint(equalTo: self.containerView.topAnchor).isActive = true
				songDetailVC.view.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor).isActive = true
				songDetailVC.view.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
				songDetailVC.view.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor).isActive = true
				songDetailVC.didMove(toParent: self)
			}, completion: nil)
			
		}
	}
}

extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 3
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryView.identifier, for: indexPath) as? CategoryView else {
			 return UICollectionViewCell()
		}
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		openMusicDetail()
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
		self.containerView.alpha = 0
		UIView.animate(withDuration: duration, animations: {
			self.containerView.alpha = 1
			self.containerView.layer.cornerRadius = 45
			self.containerView.layer.maskedCorners = [.layerMinXMinYCorner]
			self.containerViewHeight?.constant = containerHeight
			self.containerViewHeight?.isActive = true
			self.view.layoutIfNeeded()
		})
	}
}

extension ListViewController: ListViewControllerProtocol {
	
}

