//
//  SongDetailViewController.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/25/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import UIKit

//sourcery: AutoMockable
protocol SongDetailViewControllerProtocol: class, UIViewControllerRouting {
	
}

class SongDetailViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .yellow
	}
}

extension SongDetailViewController: SongDetailViewControllerProtocol {
	
}
