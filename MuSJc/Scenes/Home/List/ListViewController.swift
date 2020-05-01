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
	@IBOutlet weak var collectionView: UICollectionView!
	
	var swipeDown: UISwipeGestureRecognizer?
	var swipeUp: UISwipeGestureRecognizer?
	var isShowing: Bool = false
	var currentSelectedIndexPath: IndexPath?
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
		guard let songDetailVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "SongDetailViewController") as? SongDetailViewController else {
			return assertionFailure("Can't retrieve SongDetailVC")
		}
		
		songDetailVC.modalPresentationStyle = .overFullScreen
		self.present(songDetailVC, animated: true, completion: nil)
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
		if let oldIndex = currentSelectedIndexPath, let oldSelected = collectionView.cellForItem(at: oldIndex) as? CategoryView {
			oldSelected.disableHero()
			self.currentSelectedIndexPath = nil
		}
		self.currentSelectedIndexPath = indexPath
		guard let cell = collectionView.cellForItem(at: indexPath) as? CategoryView else {
			return
		}
		cell.prepareForHeroTransition()
		openMusicDetail()
		
	}
	
}

extension ListViewController {
	
	//	func isMinimized() -> Bool {
	//		return CGFloat((self.view.frame.origin.y)) > CGFloat(20)
	//	}
	
	//	func minimizeWindow(minimized: Bool, animated: Bool) {
	//
	//		var containerHeight: CGFloat
	//
	//		if minimized == true {
	//			containerHeight = 90
	//		} else {
	//			containerHeight = view.frame.height
	//		}
	//
	//		let duration: TimeInterval = (animated) ? 0.5 : 0.0
	//		self.containerView.alpha = 0
	//		UIView.animate(withDuration: duration, animations: {
	//			self.containerView.alpha = 1
	//			self.containerView.layer.cornerRadius = 45
	//			self.containerView.layer.maskedCorners = [.layerMinXMinYCorner]
	//			self.containerViewHeight?.constant = containerHeight
	//			self.containerViewHeight?.isActive = true
	//			self.view.layoutIfNeeded()
	//		})
	//	}
}

extension ListViewController: ListViewControllerProtocol {
	
}

