//
//  UIApplicationProtocol.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/25/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import UIKit

//sourcery: AutoMockable
protocol UIApplicationProtocol {
	
	var keyWindow: UIWindow? { get }
	var rootViewController: UIViewController? { get set }
	var settingUrl: URL? { get }
	// Todo : Tabbar
//	var tabBarController:
	func open(
        _ url: URL,
        options: [UIApplication.OpenExternalURLOptionsKey: Any],
        completionHandler completion: ((Bool) -> Void)?
    )
	func topViewController(controller: UIViewController?) -> UIViewController?
}

extension UIApplication: UIApplicationProtocol {

	var rootViewController: UIViewController? {
		get { return keyWindow?.rootViewController }
		set { keyWindow?.rootViewController = newValue }
	}
	
	var settingUrl: URL? {
		return URL(string: UIApplication.openSettingsURLString)
	}
	
	func topViewController(controller: UIViewController?) -> UIViewController? {
		var base: UIViewController?
		if controller == nil {
			base = rootViewController
		} else {
			base = controller
		}
		if let navigationController = base as? UINavigationController {
			return topViewController(controller: navigationController.visibleViewController)
		}
		// Add Tabbar
		if let presented = base?.presentingViewController {
			return topViewController(controller: presented)
		}
		return base
	}
}
