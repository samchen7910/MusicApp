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
	
	@IBOutlet weak var musicView: UIView!
	
	@IBOutlet weak var musicViewTopAnchor: NSLayoutConstraint!
	@IBOutlet weak var scrollView: UIScrollView!
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .red
		scrollView.delegate = self
	}
	
	@IBAction func videoButtonTapped(_ sender: Any) {
		musicView.isHidden = false
	}
	
	
}

extension ListViewController: UIScrollViewDelegate {
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		print(self.scrollView.contentOffset.y)
		
		musicViewTopAnchor.constant = musicViewTopAnchor.constant - self.scrollView.contentOffset.y
	}
}

extension ListViewController: ListViewControllerProtocol {
	
}
