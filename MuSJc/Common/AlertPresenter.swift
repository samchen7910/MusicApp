//
//  AlertPresenter.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/25/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import UIKit

//sourcery: AutoMockable
protocol AlertPresenterProtocol {
	func presentAlert(title: String?, description: String?, actions: [UIAlertAction])
	func presentActionSheet(title: String?, description: String?, actions: [UIAlertAction])
	func presentActionAttributed(title: NSAttributedString, description: NSAttributedString, actions: [UIAlertAction])
}

class AlertPresenter: AlertPresenterProtocol {
	
	private let topViewControllerProvider: TopViewControllerProviderProtocol
	
	init(topViewControllerProvider: TopViewControllerProviderProtocol) {
		self.topViewControllerProvider = topViewControllerProvider
	}
	
	func presentAlert(title: String?, description: String?, actions: [UIAlertAction]) {
		let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
		actions.forEach { alert.addAction($0) }
		topViewControllerProvider.topViewController()?.present(alert, animated: true, completion: nil)
	}
	
	func presentActionSheet(title: String?, description: String?, actions: [UIAlertAction]) {
		let alert = UIAlertController(title: title, message: description, preferredStyle: .actionSheet)
		actions.forEach { alert.addAction($0) }
		topViewControllerProvider.topViewController()?.present(alert, animated: true, completion: nil)
	}
	func presentActionAttributed(title: NSAttributedString, description: NSAttributedString, actions: [UIAlertAction]) {
		let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
		alert.setValue(title, forKey: "attributedTitle")
		alert.setValue(description, forKey: "attributedMessage")
		actions.forEach { alert.addAction($0) }
		topViewControllerProvider.topViewController()?.present(alert, animated: true, completion: nil)
	}
	
	
	
	
	
}
