//
//  RootNavigatorRouter.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/25/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
protocol RootNavigatorRouterProtocol {
	func route(to scene: RootNavigatorRouter.Scene)
}

class RootNavigatorRouter: RootNavigatorRouterProtocol {
	
	enum Scene {
		case login, home
	}
	
	private var application: UIApplicationProtocol
	private let homeStoryboard: Storyboard
	private let authenticationStoryboard: Storyboard
	
	init(application: UIApplicationProtocol,
		 homeStoryboard: Storyboard,
		 authenticationStoryboard: Storyboard) {
		self.application = application
		self.homeStoryboard = homeStoryboard
		self.authenticationStoryboard = authenticationStoryboard
	}
	
	func route(to scene: Scene) {
		switch scene {
		case .home:
			application.rootViewController = homeStoryboard.initial()
		case .login:
			application.rootViewController = authenticationStoryboard.initial()
		}
	}
}
