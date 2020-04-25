//
//  RootNavigator.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/25/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import Foundation
import UIKit

// sourcery: AutoMockable
protocol RootNavigatorProtocol {
	func setRootViewController()
	func setTabBarAsRoot()
	func setLoginAsRoot()
}

class RootNavigator: RootNavigatorProtocol {
	
	// To do: Add AuthManager
	private let router: RootNavigatorRouterProtocol
	
	init(router: RootNavigatorRouterProtocol) {
		self.router = router
	}
	
	func setRootViewController() {
		// To do: check AuthManager
		router.route(to: .home)
	}
	
	func setLoginAsRoot() {
		router.route(to: .login)
	}
	
	func setTabBarAsRoot() {
		// To do: Add tabbar
		
	}
}
