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
	case category
	case list
	
	var identifier: String {
		switch self {
		case .detail:
			return "SongDetailViewController"
		case .category:
			return "ListViewController"
		case .list:
			return "SongListViewController"
		}
	}
}
