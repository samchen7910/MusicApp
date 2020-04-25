//
//  StoryboardProtocol.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/25/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

//sourcery: AutoMockable
protocol StoryboardId {
	var identifier: String { get }
}

//sourcery: AutoMockable
protocol Storyboard {
	func initial<T: UIViewController>() -> T?
	func viewController<T: UIViewController>(identifier: StoryboardId) -> T?
}
