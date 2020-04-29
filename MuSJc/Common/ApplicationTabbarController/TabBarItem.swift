//
//  TabBarItem.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/28/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import UIKit

enum TabBarItem: Equatable, CaseIterable {
	
	case home, search, library, account
	
	var icon: UIImage {
		switch self {
		case .home:
			return #imageLiteral(resourceName: "home_Off")
		case .search:
			return #imageLiteral(resourceName: "search_Off")
		case .library:
			return #imageLiteral(resourceName: "library_Off")
		case .account:
			return #imageLiteral(resourceName: "account_Off")
		}
	}
	
	var title: String {
		switch self {
		case .home:
			return "Home"
		case .search:
			return "Search"
		case .library:
			return "Library"
		case .account:
			return "Account"
		}
	}
	
	var tag: Int {
		switch self {
		case .home:
			return 0
		case .search:
			return 1
		case .library:
			return 2
		case .account:
			return 3
		}
	}
}

struct TabBarItemViewModel: Equatable {
	let icon: UIImage
	let title: String
	let viewController: UIViewController?
	let tag: Int
}

