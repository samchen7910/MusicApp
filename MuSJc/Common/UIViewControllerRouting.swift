//
//  UIViewControllerRouting.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/25/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import UIKit

//sourcery: AutoMockable
protocol UIViewControllerRouting: class {
	func present(_ viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)?)
	func dismiss(animated: Bool, completion: (() -> Void)?)
	func show(_ vc: UIViewController, sender: Any?)
	func pop(animated: Bool)
	func popToRoot(animated: Bool)
	
	var presentedViewController: UIViewController? { get }
	var navigationController: UINavigationController? { get }
	var presentingViewController: UIViewController? { get }
}

extension UIViewController: UIViewControllerRouting {
	
	func pop(animated: Bool) {
		navigationController?.popViewController(animated: animated)
	}
	
	func popToRoot(animated: Bool) {
		navigationController?.popToRootViewController(animated: animated)
	}
}
