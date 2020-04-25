//
//  SharedAssembly.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/25/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import SwinjectAutoregistration
import Swinject
import AVFoundation
import IQKeyboardManagerSwift
import Firebase
import StoreKit
import Alamofire

class SharedAssesmbly: Assembly {
	
	let shareContainer = Container()
	
	func assemble(container: Container) {
		// Firebase
		container.autoregister(ApplicationFirebaseProtocol.self, initializer: ApplicationFirebase.init).inObjectScope(.container)
		
		// IQKeyboard
		container.register(IQKeyboardManagerProtocol.self ) { _ in
			return IQKeyboardManager.shared
		}
		
		// Error
		container.autoregister(ErrorHandlerProtocol.self, initializer: ErrorHandler.init)
		
		// Alert
		container.autoregister(AlertPresenterProtocol.self, initializer: AlertPresenter.init)
		
		// TopViewControllerProvider
		container.autoregister(TopViewControllerProviderProtocol.self, initializer: TopViewControllerProvider.init)
		
		
	}
}
