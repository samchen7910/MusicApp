//
//  TabBarPresenter.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/28/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
protocol TabBarPresenterProtocol {
	func presentTabBar(items: [TabBarItem])
	func set(viewController: TabBarViewControllerProtocol?)
}

class TabBarPresenter: TabBarPresenterProtocol {
	private weak var viewController: TabBarViewControllerProtocol?
	private let viewModelProvider: TabBarViewModelProviderProtocol
	
	init(viewModelProvider: TabBarViewModelProviderProtocol) {
		self.viewModelProvider = viewModelProvider
	}
	
	func presentTabBar(items: [TabBarItem]) {
		viewController?.displayTabBar(items.compactMap { [weak self] results in
			self?.viewModelProvider.viewModel(for: results)
		})
	}
	
	func set(viewController: TabBarViewControllerProtocol?) {
		self.viewController = viewController
	}
}
