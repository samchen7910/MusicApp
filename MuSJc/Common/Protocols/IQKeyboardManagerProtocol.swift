//
//  IQKeyboardManagerProtocol.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/25/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import IQKeyboardManagerSwift

//sourcery: AutoMockable
protocol IQKeyboardManagerProtocol {
	var enable: Bool { get set }
	var enableAutoToolbar: Bool { get set }
	var shouldResignOnTouchOutside: Bool { get set }
	var disabledDistanceHandlingClasses: [UIViewController.Type] { get set }
}

extension IQKeyboardManager: IQKeyboardManagerProtocol {}
