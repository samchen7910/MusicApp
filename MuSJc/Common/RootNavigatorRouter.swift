//
//  RootNavigatorRouter.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/25/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

//sourcery: AutoMockable
protocol RootNavigatorRouterProtocol {
	func route(to scene: RootNavigatorRouter.Scene)
}

class RootNavigatorRouter: RootNavigatorRouterProtocol {
	
	enum Scene {
		case login, home
	}
	
	private var application: UIApplicationProtocol
	private let authenticationStoryboard: Storyboard
	
	init(application: UIApplicationProtocol,
		 authenticationStoryboard: Storyboard) {
		self.application = application
		self.authenticationStoryboard = authenticationStoryboard
	}
	
	func route(to scene: Scene) {
		switch scene {
		case .home:
			let sharedAssesmbly = SharedAssesmbly()
			let sharedContainer = sharedAssesmbly.shareContainer
			sharedAssesmbly.assemble(container: sharedContainer)
			guard let tabbar = sharedContainer.resolve(TabBarViewController.self) else {
				return assertionFailure("Failed")
			}
			application.rootViewController = tabbar
		case .login:
			application.rootViewController = authenticationStoryboard.initial()
		}
	}
	
	
}
