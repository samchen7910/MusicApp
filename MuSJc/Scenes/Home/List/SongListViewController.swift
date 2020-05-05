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
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	func setUpCollectionViewFlowLayout() {
		guard let flow = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
		flow.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		flow.minimumLineSpacing = 0
		flow.minimumInteritemSpacing = 10
		flow.itemSize = CGSize(width: view.frame.width, height: <#T##CGFloat#>)
		
	}
}

extension SongListViewController: UICollectionViewDelegate {
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
	}
}

extension SongListViewController: SongListViewControllerProtocol {}
