//
//  HomeStoryboarId.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/25/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import Foundation

enum HomeStoryboardId: StoryboardId {
	
	case detail
	case list
	case tabBar
	
	var identifier: String {
		switch self {
		case .detail:
			return ""
		case .list:
			return "ListViewController"
		case .tabBar:
			return "TabBarViewController"
		}
	}
}
