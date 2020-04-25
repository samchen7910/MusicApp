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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .red
	}
}

extension ListViewController: ListViewControllerProtocol {
	
}
