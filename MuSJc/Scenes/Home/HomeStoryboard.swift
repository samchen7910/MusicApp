//
//  HomeStoryboard.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/25/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import Swinject
import SwinjectStoryboard

class HomeStoryboard: Storyboard {
	
	private let container: Container
	private let assembly: Assembly
	private let storyboard: SwinjectStoryboard
	
	init(shareContainer: Container, assembly: Assembly) {
		self.assembly = assembly
		container = Container(parent: shareContainer)
		assembly.assemble(container: container)
		storyboard = SwinjectStoryboard.create(name: "Home", bundle: nil, container: container)
	}
	
	func initial<T: UIViewController>() -> T? {
		return storyboard.instantiateInitialViewController() as? T
	}
	
	func viewController<T: UIViewController>(identifier: StoryboardId) -> T? {
		return storyboard.instantiateViewController(withIdentifier: identifier.identifier) as? T
	}
}
