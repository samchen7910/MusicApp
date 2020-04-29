//
//  TabBarInteractor.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/28/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
protocol TabBarInteractorProtocol {
	var items: [TabBarItem] { get }
	func handleViewDidLoad()
}

class TabBarInteractor: TabBarInteractorProtocol {
	private let presenter: TabBarPresenterProtocol
	private(set) var items: [TabBarItem] = []
	
	init(presenter: TabBarPresenterProtocol) {
		self.presenter = presenter
	}
	
	func handleViewDidLoad() {
		self.items = TabBarItem.allCases
		presenter.presentTabBar(items: TabBarItem.allCases)
	}
}
