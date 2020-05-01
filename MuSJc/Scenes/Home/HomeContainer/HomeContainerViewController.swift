//
//  HomeContainerViewController.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 5/1/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import UIKit

protocol HomeContainerViewControllerProtocol: class, UIViewControllerRouting {
	
}

class HomeContainerViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
}

extension HomeContainerViewController: HomeContainerViewControllerProtocol {
	
}
