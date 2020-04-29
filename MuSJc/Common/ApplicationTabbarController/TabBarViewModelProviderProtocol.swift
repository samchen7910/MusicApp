//
//  TabbarViewModelProviderProtocol.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/28/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
protocol TabBarViewModelProviderProtocol {
	func viewModel(for item: TabBarItem) -> TabBarItemViewModel
}

class TabBarViewModelProvider: TabBarViewModelProviderProtocol {
	
	private let homeStoryboard: Storyboard
	private let searchStoryboard: Storyboard
	private let libraryStoryboard: Storyboard
	private let authStoryboard: Storyboard
	
	init(
		homeStoryboard: Storyboard,
		searchStoryboard: Storyboard,
		libraryStoryboard: Storyboard,
		authStoryboard: Storyboard) {
		self.homeStoryboard = homeStoryboard
		self.searchStoryboard = searchStoryboard
		self.libraryStoryboard = libraryStoryboard
		self.authStoryboard = authStoryboard
	}
	
	func viewModel(for item: TabBarItem) -> TabBarItemViewModel {
		var storyboard: Storyboard?
		switch item {
		case .home:
			storyboard = homeStoryboard
		case .search:
			storyboard = searchStoryboard
		case .library:
			storyboard = libraryStoryboard
		case .account:
			storyboard = authStoryboard
		}
		return TabBarItemViewModel(
			icon: item.icon,
			title: item.title,
			viewController: storyboard?.initial(),
			tag: item.tag)
	}
}
