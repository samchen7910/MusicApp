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
		
		// TabBar
		// To do: change to correct storyboard
		
		container.register(TabBarViewModelProviderProtocol.self) { resolver in
			return TabBarViewModelProvider(
				homeStoryboard: resolver ~> (Storyboard.self, name: "Home") ,
				searchStoryboard: resolver ~> (Storyboard.self, name: "Home"),
				libraryStoryboard: resolver ~> (Storyboard.self, name: "Home"),
				authStoryboard: resolver ~> (Storyboard.self, name: "Home"))
		}
		
		
		// Root View
		container.register(UIApplicationProtocol.self) { _ in UIApplication.shared }
		
		container.autoregister(TabBarInteractorProtocol.self, initializer: TabBarInteractor.init)
		container.autoregister(TabBarPresenterProtocol.self, initializer: TabBarPresenter.init)
		container.register(TabBarViewController.self) { resolver in
			let vc = TabBarViewController()
			let presenter = resolver ~> (TabBarPresenterProtocol.self)
			presenter.set(viewController: vc)
			vc.set(interactor: resolver ~> TabBarInteractorProtocol.self)
			vc.prepare()
			return vc
		}
		

		

		container.register(RootNavigatorRouterProtocol.self) {
			return RootNavigatorRouter(application: $0 ~> (UIApplicationProtocol.self),
									   
									   authenticationStoryboard: $0 ~> (Storyboard.self, name: "Home")) // To do: change Home to Authentication
		}
		
		container.register(Storyboard.self, name: "Home") {_ in
			return HomeStoryboard(shareContainer: self.shareContainer, assembly: HomeAssembly())
		}
		
		container.register(TabBarViewModelProviderProtocol.self) { resolver in
			return TabBarViewModelProvider(
				homeStoryboard: resolver ~> (Storyboard.self, name: "Home") ,
				searchStoryboard: resolver ~> (Storyboard.self, name: "Home"),
				libraryStoryboard: resolver ~> (Storyboard.self, name: "Home"),
				authStoryboard: resolver ~> (Storyboard.self, name: "Home"))
		}
		container.autoregister(TabBarInteractorProtocol.self, initializer: TabBarInteractor.init)
		
		container.register(TabBarPresenterProtocol.self) { resolver in
			return TabBarPresenter(viewModelProvider: resolver ~> (TabBarViewModelProviderProtocol.self))
		}
		container.register(TabBarViewController.self) { resolver in
			let vc = TabBarViewController()
			let presenter = resolver ~> (TabBarPresenterProtocol.self)
			presenter.set(viewController: vc)
			vc.set(interactor: resolver ~> TabBarInteractorProtocol.self)
			vc.prepare()
			return vc
		}
		
		
		container.register(RootNavigatorProtocol.self) {
			return RootNavigator(router: $0 ~> RootNavigatorRouterProtocol.self)
		}
		
	
		
		
		
	
		
	
	}
}
