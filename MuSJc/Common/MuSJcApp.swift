//
//  MuSJcApp.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/25/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration
import RxSwift

class MuSJcApp {
	
	// MARK: - Private
	private let rootNavigator: RootNavigatorProtocol
	private let firebase: ApplicationFirebaseProtocol
	private var iqKeyboardManager: IQKeyboardManagerProtocol
	private let application: UIApplicationProtocol
	private let disposeBag = DisposeBag()
	
	init(firebase: ApplicationFirebaseProtocol,
		 iqKeyboardManager: IQKeyboardManagerProtocol,
		 application: UIApplicationProtocol,
		 rootNavigator: RootNavigatorProtocol) {
		self.firebase = firebase
		self.iqKeyboardManager = iqKeyboardManager
		self.application = application
		self.rootNavigator = rootNavigator
	}
	
	convenience init() {
		let sharedAssembly = SharedAssesmbly()
		let shareContainer = sharedAssembly.shareContainer
		sharedAssembly.assemble(container: shareContainer)
		
		let iqKeyboardManager = shareContainer ~> IQKeyboardManagerProtocol.self
		let firebase = shareContainer ~> ApplicationFirebaseProtocol.self
		let application = shareContainer ~> UIApplicationProtocol.self
		let rootNavigator = shareContainer ~> RootNavigatorProtocol.self
		
		self.init(firebase: firebase,
		iqKeyboardManager: iqKeyboardManager,
		application: application,
		rootNavigator: rootNavigator)
	}
	
	func prepare() {
		iqKeyboardManager.enable = true
		iqKeyboardManager.enableAutoToolbar = false
		iqKeyboardManager.shouldResignOnTouchOutside = true
		rootNavigator.setRootViewController()
	}
}
