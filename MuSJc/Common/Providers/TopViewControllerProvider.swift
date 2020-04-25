//
//  TopViewControllerProvider.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/25/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import UIKit

//sourcery: AutoMockable
protocol TopViewControllerProviderProtocol {
	
	func topViewController() -> UIViewControllerRouting?
}

class TopViewControllerProvider: TopViewControllerProviderProtocol {
	
	private let application: UIApplicationProtocol
	
	init(application: UIApplicationProtocol) {
		self.application = application
	}
	
	func topViewController() -> UIViewControllerRouting? {
		return application.topViewController(controller: nil)
	}
}
