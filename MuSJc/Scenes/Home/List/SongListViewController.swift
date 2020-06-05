//
//  SongListViewController.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 5/6/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import UIKit

protocol SongListViewControllerProtocol: class, UIViewControllerRouting {
	
}

class SongListViewController: UIViewController {
	
	@IBOutlet weak var topImageView: UIImageView!
	@IBOutlet weak var collectionView: UICollectionView!
	private var swipeDown: UISwipeGestureRecognizer?
	private var swipeUp: UISwipeGestureRecognizer?
	private let dataSource = SongListDataSource()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setUpCollectionViewFlowLayout()
		prepareForHero()
		prepare()
	}
	
	func prepare() {
		collectionView.register(UINib(nibName: SongView.identifier, bundle: nil), forCellWithReuseIdentifier: SongView.identifier)
		collectionView.delegate = self
		collectionView.dataSource = dataSource
		swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeDownAction))
		swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeUpAction))
		swipeDown?.direction = .down
		swipeUp?.direction = .up
		self.view.addGestureRecognizer(swipeDown!)
		self.view.addGestureRecognizer(swipeUp!)
	}
	
	func setUpCollectionViewFlowLayout() {
		guard let flow = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
		flow.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		flow.minimumLineSpacing = 0
		flow.minimumInteritemSpacing = 10
		flow.itemSize = CGSize(width: view.frame.width * 0.8, height: 70)
	}
	
	func prepareForHero() {
		hero.isEnabled = true
		topImageView.hero.isEnabled = true
		topImageView.hero.id = "CategoryViewImage"
	}
	
	func disableHero() {
		topImageView.hero.isEnabled = false
	}
}

@objc extension SongListViewController {
	
	func swipeDownAction() {
		self.dismiss(animated: true, completion: nil)
	}
	
	func swipeUpAction() {
	}
}

extension SongListViewController: UICollectionViewDelegate {
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		guard let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "SongDetailViewController") as? SongDetailViewController else {
			return assertionFailure("Can't retrieve SongDetailVC")
		}
		navigationController?.pushViewController(vc, animated: true)
	}
}

extension SongListViewController: SongListViewControllerProtocol {}
